import 'package:dalel_app/core/widgets/custom_loading_item.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndecatorHorizontalList extends StatelessWidget {
  const CustomLoadingIndecatorHorizontalList({super.key,required  this.wideContainer});
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
            return CustomLoadingItem(wideContainer: wideContainer);
          }),
    );
  }
}


