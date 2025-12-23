import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../data/home_repository.dart';
import '../widgets/category_card.dart';
import '../widgets/premium_banner.dart';
import '../widgets/question_card.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning! ☀️';
    } else if (hour < 17) {
      return 'Good Afternoon! 👋';
    } else {
      return 'Good Evening! 🌙';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepository(DioClient()))..loadData(),
      child: Scaffold(
        body: Stack(
          children: [
            // Background image at top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/home_page_background.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            // Content with gradient overlay
            SafeArea(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.status == HomeStatus.loading || state.status == HomeStatus.initial) {
                    return const Center(child: LoadingIndicator());
                  }

                  if (state.status == HomeStatus.failure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.errorMessage ?? 'An error occurred', style: AppTextStyles.bodyMedium),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => context.read<HomeCubit>().loadData(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppConstants.pagePaddingVertical),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, plant lover!',
                                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _getGreeting(),
                                  style: AppTextStyles.heading2.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Search
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                            child: const SearchField(),
                          ),
                          const SizedBox(height: 20),
                          // Premium Banner
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                            child: PremiumBanner(onTap: () => context.push(AppRoute.paywall.path)),
                          ),
                          const SizedBox(height: 20),
                          // Questions List (NO section title per design)
                          SizedBox(
                            height: 164,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                              itemCount: state.questions.length,
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                return QuestionCard(question: state.questions[index]);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Categories Grid (2 columns)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.0,
                              ),
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) {
                                return CategoryCard(category: state.categories[index]);
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
