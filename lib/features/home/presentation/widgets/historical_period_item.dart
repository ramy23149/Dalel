import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;

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
                historicalPeriodsModel.name,
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
            if(historicalPeriodsModel.image != null)
            AppImageRenderer.network(
              historicalPeriodsModel.image!,fit: BoxFit.contain,)
          ],
        ),
      ),
    );
  }
}
