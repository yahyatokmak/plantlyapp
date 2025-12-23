import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class FeatureItem extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String subtitle;

  const FeatureItem({
    super.key,
    this.icon,
    this.imagePath,
    required this.title,
    required this.subtitle,
  }) : assert(icon != null || imagePath != null, 'Either icon or imagePath must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.paywallBlack24,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.paywallWhite30, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.paywallCardDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: imagePath != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(imagePath!, color: AppColors.textWhite),
                  )
                : Icon(icon, color: AppColors.textWhite, size: 20),
          ),
          const Spacer(),
          Text(title, style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textWhite, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(subtitle, style: AppTextStyles.bodySmall.copyWith(color: AppColors.paywallWhite70)),
        ],
      ),
    );
  }
}
