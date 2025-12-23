import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/route_names.dart' show AppRoute;
import '../../../core/storage/local_storage.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/primary_button.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (_pageController.hasClients) {
              _pageController.animateToPage(state.currentPage, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            }
          },
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppConstants.pagePaddingVertical),
                  child: Column(
                    children: [
                      // PageView
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            context.read<OnboardingCubit>().setPage(index);
                          },
                          children: [
                            _OnboardingContent(
                              titleSpans: [
                                const TextSpan(text: 'Take a photo to '),
                                TextSpan(text: 'identify', style: AppTextStyles.onboardingTitleBold),
                                const TextSpan(text: '\nthe plant!'),
                              ],
                              imagePath: 'assets/images/onboarding_2_img.png',
                            ),
                            _OnboardingContent(
                              titleSpans: [
                                const TextSpan(text: 'Get plant '),
                                TextSpan(text: 'care guides', style: AppTextStyles.onboardingTitleBold),
                              ],
                              imagePath: 'assets/images/onboarding_3_img.png',
                            ),
                          ],
                        ),
                      ),
                      // Bottom section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                        child: Column(
                          children: [
                            // Continue Button
                            PrimaryButton(
                              text: 'Continue',
                              onPressed: () async {
                                if (state.isLastPage) {
                                  final prefs = await SharedPreferences.getInstance();
                                  final localStorage = LocalStorage(prefs);
                                  await localStorage.setOnboardingCompleted();
                                  if (context.mounted) {
                                    context.go(AppRoute.paywall.path);
                                  }
                                } else {
                                  context.read<OnboardingCubit>().nextPage();
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            // Page indicator
                            PageIndicator(currentPage: state.currentPage, pageCount: state.totalPages),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  final List<TextSpan> titleSpans;
  final String imagePath;

  const _OnboardingContent({required this.titleSpans, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
      child: Column(
        children: [
          // Title - Left aligned
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(style: AppTextStyles.onboardingTitleRegular, children: titleSpans),
            ),
          ),
          // Illustration - fills remaining space
          Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
        ],
      ),
    );
  }
}
