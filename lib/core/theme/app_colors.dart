import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary Colors
  static const Color primaryGreen = Color(0xFF28AF6E);
  static const Color primaryGreenDark = Color(0xFF24A965);

  // Text Colors
  static const Color textPrimary = Color(0xFF13231B);
  static const Color textPrimary70 = Color(0xB213231B);
  static const Color textSecondary = Color(0xFF597165);
  static const Color textSecondary70 = Color(0xB2597165);
  static const Color textGrey = Color(0xFF979798);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Background Colors
  static const Color background = Color(0xFFFBFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color iconBackground = Color(0xFFADB4BB);

  // Gradient Colors
  static const Color gradientStart = Color(0xFF28AF6E);
  static const Color gradientEnd = Color(0xFF24A965);

  // Border Colors
  static const Color border = Color(0xFFE8E8E8);
  static const Color borderLight = Color(0xFFF0F0F0);

  // Overlay
  static const Color overlay = Color(0x80000000);

  // Snackbar Colors
  static const Color red = Color(0xFFE53935);
  static const Color orange = Color(0xFFFB8C00);
  static const Color green700 = Color(0xFF388E3C);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [gradientStart, gradientEnd]);

  static const LinearGradient premiumGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF28AF6E), Color(0xFF2CBA73)]);
}
