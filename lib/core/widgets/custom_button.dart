import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class CustomBotton extends StatelessWidget {
  const CustomBotton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.textColor,
      required this.text,
      this.onPressed,
      this.width, this.child});

  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final void Function()? onPressed;
  final double? width;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10)),
            backgroundColor: backgroundColor ?? AppColors.primaryColor),
        onPressed: onPressed,
        child: child ?? Text(
          text,
          style: AppTextStyles.poppins500style18.copyWith(
            color: textColor ?? AppColors.offWhite,
          ),
        ),
      ),
    );
  }
}
