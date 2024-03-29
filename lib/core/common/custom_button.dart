import 'package:flutter/material.dart';
import 'package:let_tutor/core/utils/colors.dart';

// A common button
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? callback;
  final Color backgroundColor;
  final Color? titleColor;
  final double textSize;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Icon? icon;
  final bool? isInProgress;
  const CustomButton({
    super.key,
    required this.title,
    this.callback,
    this.backgroundColor = AppColors.primaryElement,
    this.titleColor,
    this.textSize = 16,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    this.borderColor = Colors.transparent,
    this.icon,
    this.isInProgress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        foregroundColor: borderColor,
        shadowColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      onPressed: callback,
      child: isInProgress == true
          ? Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: titleColor ?? Colors.white,
                  strokeWidth: 2,
                ),
              ),
            )
          : RichText(
              text: TextSpan(
                style: TextStyle(
                  color: titleColor,
                  fontSize: textSize,
                ),
                children: [
                  if (icon != null)
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: icon,
                      ),
                    ),
                  TextSpan(
                    text: title,
                  ),
                ],
              ),
            ),
    );
  }
}
