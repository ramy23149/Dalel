import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreTextWidget extends StatelessWidget {
  const CustomReadMoreTextWidget({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(text,
        style: AppTextStyles.poppins500style14,
        trimMode: TrimMode.Line,
        trimLines: 10,
        colorClickableText: AppColors.offGrey,
        trimCollapsedText: AppStrings.read_more,
        trimExpandedText: AppStrings.show_less,
        moreStyle: AppTextStyles.poppins500style14);
  }
}
