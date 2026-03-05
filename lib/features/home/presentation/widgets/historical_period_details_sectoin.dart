import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_read_more_text_widget.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodDetailsSectoin extends StatelessWidget {
  const HistoricalPeriodDetailsSectoin(
      {super.key, required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(
              text: "${AppStrings.about} ${historicalPeriodsModel.name}",
            ),
            SizedBox(
              width: 8,
            ),
            AppImageRenderer.assets(Assets.imagesDetailsMace),
          ],
        ),
        SizedBox(
          height: 47,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -25,
                    left: -10,
                    child: AppImageRenderer.assets(
                      Assets.imagesDetailsPrimades,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomReadMoreTextWidget(
                      text: historicalPeriodsModel.description),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppImageRenderer.network(
                historicalPeriodsModel.image!,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
