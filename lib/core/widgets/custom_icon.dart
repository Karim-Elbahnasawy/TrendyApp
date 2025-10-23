import 'package:flutter/material.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: AppColors.greyF3,
        foregroundColor: AppColors.black,
        radius: 25,
        child: Icon(size: 25, icon),
      ),
    );
  }
}