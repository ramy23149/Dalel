import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class CustomWelcomeBanner extends StatelessWidget {
  const CustomWelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppStrings.appName,
            style: AppTextStyles.saira700style32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppImageRenderer.assets(Assets.imagesPeramides),
              AppImageRenderer.assets(Assets.imagesMosque)
            ],
          )
        ],
      ),
    );
  }
}
