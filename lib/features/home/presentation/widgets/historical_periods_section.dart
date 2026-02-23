import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';

import 'historical_period_item.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text: AppStrings.Historical_periods,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [HistoricalPeriodItem(), HistoricalPeriodItem()],
        )
      ],
    );
  }
}
