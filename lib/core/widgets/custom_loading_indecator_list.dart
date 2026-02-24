import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndecatorList extends StatelessWidget {
  const CustomLoadingIndecatorList({super.key,required  this.wideContainer});
  final bool wideContainer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
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
          }),
    );
  }
}
