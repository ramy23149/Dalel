import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key, required this.image, required this.name,  this.onTap});
  final String image, name;
  final VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: 100,
        height: 165,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 4),
          child: GestureDetector(
            onTap: onTap,
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
                      height: 96,
                      child: AppImageRenderer.network(
                        image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 7),
                    Column(
                      children: [
                        Text(
                          name,
                          style: AppTextStyles.poppins500style16
                              .copyWith(color: AppColors.deepBrown),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
