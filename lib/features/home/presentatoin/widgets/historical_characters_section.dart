import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentatoin/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historical_characters),
        SizedBox(height: 16),
        SizedBox(
          height: 185,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomCategoryListViewItem(),
            itemCount: 6,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
