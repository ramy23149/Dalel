import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 5),
      child: SizedBox(
        width: 100,
        child: Card(
          margin: EdgeInsets.zero,
          color: AppColors.white,
          elevation: 5,
          shadowColor: AppColors.grey,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(5),
            child: Column(
              children: [
                AppImageRenderer.assets(
                  Assets.imagesLionHeartKing,
                  width: double.infinity,
                ),
                SizedBox(height: 12),
                Text(
                  "Lionheart",
                  style: AppTextStyles.poppins500style16
                      .copyWith(color: AppColors.deepBrown),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
