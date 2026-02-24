import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingItem extends StatelessWidget {
  const CustomLoadingItem({
    super.key,
    required this.wideContainer,
  });

  final bool wideContainer;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        child: UnconstrainedBox(
          child: Container(
            height: wideContainer ? 96:133,
            width: wideContainer ? 164:74, 
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ));
  }
}