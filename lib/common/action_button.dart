import 'package:flutter/material.dart';
import 'package:let_tutor/utils/colors.dart';

// A common button
class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color titleColor;
  final double textSize;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  const ActionButton({
    super.key,
    required this.title,
    required this.callback,
    this.backgroundColor = AppColors.primaryElement,
    this.titleColor = AppColors.primaryElementText,
    this.textSize = 16,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: callback,
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: textSize,
        ),
      ),
    );
  }
}
