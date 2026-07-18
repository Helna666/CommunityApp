import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
          ),
        ],
      ),

      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,

        items: items,

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor: AppColors.primary,

        unselectedItemColor: Colors.grey,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),

        elevation: 0,
      ),
    );
  }
}