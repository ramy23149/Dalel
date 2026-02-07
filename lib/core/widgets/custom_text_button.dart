import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({super.key, this.onPressed, required this.text, this.foregroundColor});
  final VoidCallback? onPressed;
  final String text;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor:foregroundColor ?? AppColors.deepGrey,
          textStyle: AppTextStyles.poppins400style16.copyWith(
            decoration: TextDecoration.combine(
              [TextDecoration.underline, TextDecoration.none],
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
