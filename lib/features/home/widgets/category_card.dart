import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_cached_image.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Title at top-left
          Positioned(
            top: 16,
            left: 16,
            right: 60,
            child: Text(
              category.title,
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Image at bottom-right
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: category.image.width.toDouble(),
              height: category.image.height.toDouble(),
              child: AppCachedImage(imageUrl: category.image.url, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
