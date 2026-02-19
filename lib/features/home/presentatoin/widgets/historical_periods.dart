import 'package:dalel_app/features/home/presentatoin/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(),
        SizedBox(
          width: 12,
        ),
        HistoricalPeriodItem()
      ],
    );
  }
}