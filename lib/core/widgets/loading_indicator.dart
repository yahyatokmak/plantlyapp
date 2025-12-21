import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const LoadingIndicator({super.key, this.size = 40, this.strokeWidth = 3, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(strokeWidth: strokeWidth, valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primaryGreen)),
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color? overlayColor;

  const LoadingOverlay({super.key, required this.isLoading, required this.child, this.overlayColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) Container(color: overlayColor ?? AppColors.white.withValues(alpha: 0.7), child: const LoadingIndicator()),
      ],
    );
  }
}
