import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';
import 'package:flutter/material.dart';

class HistoricalWarItem extends StatelessWidget {
  const HistoricalWarItem({super.key, required this.warModel});
  final WarModel warModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  onTap: () => customPushNavigation(AppRouter.kHistoricalPeriodDetailsView),
      child: Card(
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
                  warModel.name,
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
                AppImageRenderer.network(
                  warModel.image,
                  fit: BoxFit.contain,
                )
            ],
          ),
        ),
      ),
    );
  }
}
