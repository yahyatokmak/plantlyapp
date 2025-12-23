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
  static const Color backgroundLight = Color(0xFFFCFCFC);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color iconBackground = Color(0xFFADB4BB);

  // Border Colors
  static const Color border = Color(0xFFE8E8E8);
  static const Color borderLight = Color(0xFFF0F0F0);

  // Overlay
  static const Color overlay = Color(0x80000000);

  // Paywall Colors
  static const Color paywallDark = Color(0xFF101E17);
  static const Color paywallCardDark = Color(0xFF24312A);
  static const Color paywallBorder = Color(0xFF3C4A40);
  static const Color paywallWhite5 = Color(0x0DFFFFFF);
  static const Color paywallWhite8 = Color(0x14FFFFFF);
  static const Color paywallWhite30 = Color(0x4DFFFFFF);
  static const Color paywallWhite50 = Color(0x80FFFFFF);
  static const Color paywallWhite52 = Color(0x85FFFFFF);
  static const Color paywallWhite70 = Color(0xB3FFFFFF);
  static const Color paywallBlack24 = Color(0x3D000000);
  static const Color paywallBlack40 = Color(0x66000000);
  static const Color primaryGreen24 = Color(0x3D28AF6E);

  // Snackbar Colors
  static const Color red = Color(0xFFE53935);
  static const Color orange = Color(0xFFFB8C00);
  static const Color green700 = Color(0xFF388E3C);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [primaryGreen, primaryGreenDark]);

  static const Color premiumGradientEnd = Color(0xFF2CBA73);

  static const LinearGradient premiumGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [primaryGreen, premiumGradientEnd]);

  static const LinearGradient backgroundGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [backgroundLight, backgroundGrey]);
}
