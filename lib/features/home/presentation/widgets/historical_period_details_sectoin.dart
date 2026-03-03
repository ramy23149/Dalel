import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HistoricalPeriodDetailsSectoin extends StatelessWidget {
  const HistoricalPeriodDetailsSectoin(
      {super.key, required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
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
                    left: -7,
                    child: AppImageRenderer.assets(
                      Assets.imagesDetailsPrimades,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ReadMoreText(
                    historicalPeriodsModel.description,
                    style: AppTextStyles.poppins500style14,
                    trimMode: TrimMode.Line,
                    trimLines: 10,
                    colorClickableText: AppColors.offGrey,
                    trimCollapsedText: AppStrings.read_more,
                    trimExpandedText: AppStrings.show_less,
                    moreStyle:
                        AppTextStyles.poppins500style14
                  ),
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





