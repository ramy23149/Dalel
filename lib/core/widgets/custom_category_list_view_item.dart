import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key, required this.image, required this.name});
  final String image, name;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 4),
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
                SizedBox(
                  height: 120,
                  child: AppImageRenderer.network(
                    image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  name,
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
