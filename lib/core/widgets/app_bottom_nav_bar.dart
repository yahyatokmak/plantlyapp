import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const AppBottomNavBar({super.key, this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white,
      elevation: 0,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(icon: 'assets/images/home_icon.png', label: 'Home', isActive: currentIndex == 0, onTap: () => onTap?.call(0)),
            _NavItem(icon: 'assets/images/diagnose_icon.png', label: 'Diagnose', isActive: currentIndex == 1, onTap: () => onTap?.call(1)),
            const SizedBox(width: 56), // Space for FAB
            _NavItem(icon: 'assets/images/garden_icon.png', label: 'My Garden', isActive: currentIndex == 2, onTap: () => onTap?.call(2)),
            _NavItem(icon: 'assets/images/profile_icon.png', label: 'Profile', isActive: currentIndex == 3, onTap: () => onTap?.call(3)),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavItem({required this.icon, required this.label, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primaryGreen : AppColors.navInactive;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.18,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24, height: 24, color: color),
            const SizedBox(height: 4),
            Flexible(
              child: Text(label, style: AppTextStyles.bodySmall.copyWith(color: color)),
            ),
          ],
        ),
      ),
    );
  }
}
