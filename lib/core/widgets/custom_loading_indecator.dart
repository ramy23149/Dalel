import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({super.key, this.height});
 final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child:  Center(child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
    );
  }
}