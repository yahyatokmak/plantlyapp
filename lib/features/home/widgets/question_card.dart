import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_cached_image.dart';
import '../models/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.textPrimary.withValues(alpha: 0.08), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          AppCachedImage(imageUrl: question.imageUri, fit: BoxFit.cover),

          // Text Content
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Text(
              question.title,
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
