import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreTextWidget extends StatefulWidget {
  const CustomReadMoreTextWidget({super.key, required this.text});

  final String text;

  @override
  State<CustomReadMoreTextWidget> createState() =>
      _CustomReadMoreTextWidgetState();
}

class _CustomReadMoreTextWidgetState extends State<CustomReadMoreTextWidget> {
  ValueNotifier<bool> isCollapsedNotifier = ValueNotifier<bool>(true);

  
  @override
  void dispose() {
    isCollapsedNotifier.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isCollapsedNotifier,
      builder: (context, isCollapsed, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView(
            padding: const EdgeInsets.all(0) ,
            physics: isCollapsed
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            children: [
              ReadMoreText(
                widget.text,
                isCollapsed: isCollapsedNotifier,
                style: AppTextStyles.poppins500style14,
                trimMode: TrimMode.Line,
                trimLines: 10,
                colorClickableText: AppColors.offGrey,
                trimCollapsedText: AppStrings.read_more,
                trimExpandedText: AppStrings.show_less,
                moreStyle: AppTextStyles.poppins500style14,
              ),
            ],
          ),
        );
      },
    );
  }
}