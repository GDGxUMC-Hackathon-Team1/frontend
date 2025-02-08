import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class Tag extends StatelessWidget {
  final String name;
  final Color backgroundColor;

  const Tag({
    super.key,
    required this.name,
    Color? backgroundColor
  }): backgroundColor = backgroundColor ?? AppColors.tagBackgroundGray;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
