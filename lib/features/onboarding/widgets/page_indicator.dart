import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final double dotSize;
  final double activeDotWidth;
  final double spacing;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
    this.dotSize = 6,
    this.activeDotWidth = 10,
    this.spacing = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? activeDotWidth : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: isActive ? AppColors.textPrimary : AppColors.textPrimary.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        );
      }),
    );
  }
}
