import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class PurpleCategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  PurpleCategoryButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: AnimatedContainer(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.deepPurple : AppColors.lightPurple,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


