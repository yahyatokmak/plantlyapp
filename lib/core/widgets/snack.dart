import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';

enum SnackType { error, warning, success }

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Snack {
  Snack._private();
  static final Snack _instance = Snack._private();
  static Snack get instance => _instance;

  void show(
    String title, {
    SnackType type = SnackType.warning,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    VoidCallback? onTap,
  }) {
    scaffoldMessengerKey.currentState?.removeCurrentSnackBar();

    final backgroundColor = _getBackgroundColor(type);
    const textColor = AppColors.white;

    final content = Text(
      title,
      style: const TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
      content: onTap != null
          ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: content,
            )
          : content,
    );

    if (type == SnackType.error || type == SnackType.warning) {
      HapticFeedback.heavyImpact();
    } else {
      HapticFeedback.lightImpact();
    }

    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void hide() {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  Color _getBackgroundColor(SnackType type) {
    switch (type) {
      case SnackType.error:
        return AppColors.red;
      case SnackType.warning:
        return AppColors.orange;
      case SnackType.success:
        return AppColors.green700;
    }
  }
}
