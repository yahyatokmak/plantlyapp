import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class PremiumBanner extends StatelessWidget {
  final VoidCallback onTap;

  const PremiumBanner({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(color: AppColors.premiumBannerBg, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Mail icon with notification badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => AppColors.premiumIconGradient.createShader(bounds),
                    child: const Icon(Icons.mail, color: AppColors.white, size: 36),
                  ),
                  // Red notification badge
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '1',
                          style: AppTextStyles.bodySmall.copyWith(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              // Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => AppColors.premiumTitleGradient.createShader(bounds),
                      child: Text(
                        'FREE Premium Available',
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Tap to upgrade your account!', style: AppTextStyles.bodySmall.copyWith(color: AppColors.premiumGold.withValues(alpha: 0.7), fontSize: 12)),
                  ],
                ),
              ),
              // Arrow
              const Icon(Icons.arrow_forward_ios, color: AppColors.premiumGold, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}
