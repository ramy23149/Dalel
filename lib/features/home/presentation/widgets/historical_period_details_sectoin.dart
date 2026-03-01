import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodDetailsSectoin extends StatelessWidget {
  const HistoricalPeriodDetailsSectoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(
              text: "${AppStrings.about} Ancient Egypt",
            ),
            SizedBox(
              width: 8,
            ),
            AppImageRenderer.assets(Assets.imagesDetailsMace),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text(
                    "Ancient Egypt was a civilization in Northeast Africa situated in the Nile Valley...Ancient Egypt was a civilization in Northeast Africa situated in the Nile Valley...Ancient Egypt was a civilization in Northeast Africa situated in the Nile Valley...Ancient Egypt was a civilization in Northeast Africa situated in the Nile Valley...",
                    style: AppTextStyles.poppins500style14,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppImageRenderer.assets(
                Assets.imagesFrame,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
