import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/primary_button.dart';
import '../widgets/feature_item.dart';
import '../widgets/subscription_option.dart';

class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  bool _isYearlySelected = true;

  void _onClose() {
    context.go(AppRoute.home.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paywallDark,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/paywall_image.png', fit: BoxFit.cover, height: MediaQuery.of(context).size.height * 0.6),
          ),
          // Dark Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.paywallDark.withValues(alpha: 0.7), AppColors.paywallDark],
                  stops: const [0.0, 0.4, 0.6],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: _onClose,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(color: AppColors.paywallCardDark.withValues(alpha: 0.6), shape: BoxShape.circle),
                        child: const Icon(Icons.close, color: AppColors.textWhite, size: 16),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // Bottom Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePaddingHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Row(
                        children: [
                          Text('PlantApp', style: AppTextStyles.heading1.copyWith(color: AppColors.textWhite)),
                          const SizedBox(width: 4),
                          Text(
                            'Premium',
                            style: AppTextStyles.heading2.copyWith(color: AppColors.textWhite, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Access All Features', style: AppTextStyles.onboardingSubtitle.copyWith(color: AppColors.paywallWhite70)),
                      const SizedBox(height: 20),
                      // Features
                      SizedBox(
                        height: 130,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FeatureItem(imagePath: 'assets/images/scanner_icon.png', title: 'Unlimited', subtitle: 'Plant Identify'),
                            SizedBox(width: 8),
                            FeatureItem(icon: Icons.speed, title: 'Faster', subtitle: 'Process'),
                            SizedBox(width: 8),
                            FeatureItem(icon: Icons.spa, title: 'Detailed', subtitle: 'Plant care'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Subscription Options
                      SubscriptionOption(title: '1 Month', price: '\$2.99/month, auto renewable', isSelected: !_isYearlySelected, onTap: () => setState(() => _isYearlySelected = false)),
                      const SizedBox(height: 16),
                      SubscriptionOption(
                        title: '1 Year',
                        price: 'First 3 days free, then \$529.99/year',
                        isSelected: _isYearlySelected,
                        showSaveBadge: true,
                        onTap: () => setState(() => _isYearlySelected = true),
                      ),
                      const SizedBox(height: 24),
                      // CTA Button
                      PrimaryButton(text: 'Try free for 3 days', onPressed: _onClose),
                      const SizedBox(height: 8),
                      // Terms
                      Text(
                        'After the 3-day free trial period you\'ll be charged \$529.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable',
                        style: AppTextStyles.termsText.copyWith(color: AppColors.paywallWhite52),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // Terms Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Terms', style: AppTextStyles.termsLink.copyWith(color: AppColors.paywallWhite52)),
                          Text('  •  ', style: TextStyle(color: AppColors.paywallWhite52)),
                          Text('Privacy', style: AppTextStyles.termsLink.copyWith(color: AppColors.paywallWhite52)),
                          Text('  •  ', style: TextStyle(color: AppColors.paywallWhite52)),
                          Text('Restore', style: AppTextStyles.termsLink.copyWith(color: AppColors.paywallWhite52)),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
