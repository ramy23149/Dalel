import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      //  margin: EdgeInsets.only(right: 16),
      color: AppColors.white,
      elevation: 5,
      shadowColor: AppColors.grey,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 65,
              height: 48,
              child: Text(
                AppStrings.Ancient_Egypt,
                style: AppTextStyles.poppins500style16
                    .copyWith(color: AppColors.deepBrown),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            AppImageRenderer.assets(Assets.imagesFrame)
          ],
        ),
      ),
    );
  }
}