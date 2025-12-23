import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/route_names.dart' show AppRoute;
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/primary_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal, vertical: AppConstants.pagePaddingVertical),
            child: Column(
              children: [
                // Title - Left aligned
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'Welcome to ', style: AppTextStyles.onboardingTitleRegular),
                            TextSpan(text: 'PlantApp', style: AppTextStyles.onboardingTitleBold),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Identify more than 3000+ plants and 88% accuracy.', style: AppTextStyles.onboardingSubtitle),
                    ],
                  ),
                ),

                Expanded(child: Image.asset('assets/images/onboarding_1_img.png', fit: BoxFit.contain)),
                const SizedBox(height: 16),
                PrimaryButton(text: 'Get Started', onPressed: () => context.pushNamed(AppRoute.onboarding.name), backgroundColor: AppColors.primaryGreen, textStyle: AppTextStyles.button),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.termsText,
                    children: [
                      const TextSpan(text: 'By tapping next, you are agreeing to PlantID\n'),
                      TextSpan(text: 'Terms of Use', style: AppTextStyles.termsLink),
                      const TextSpan(text: ' & '),
                      TextSpan(text: 'Privacy Policy', style: AppTextStyles.termsLink),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
