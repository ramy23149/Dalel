import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn(
      {super.key,
      this.onPressed,
      required this.text,
      this.enableUnderLine = true,
      this.foregroundColor,
      this.padding,
      this.style});
  final VoidCallback? onPressed;
  final String text;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final bool enableUnderLine;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          foregroundColor: foregroundColor ?? AppColors.deepGrey,
          textStyle: AppTextStyles.poppins400style16.copyWith(
              decoration: enableUnderLine
                  ? TextDecoration.combine(
                      [TextDecoration.underline, TextDecoration.none],
                    )
                  : null),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: style,
        ));
  }
}
