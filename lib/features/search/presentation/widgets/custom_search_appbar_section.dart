import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBarSection extends StatelessWidget {
  const CustomSearchAppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.deepBrown,
          ),
        ),
        Expanded(child: CustomSearchTextField()),
      ],
    );
  }
}