import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class HomeAncientWarsSection extends StatelessWidget {
  const HomeAncientWarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.ancient_wars),
        SizedBox(height: 16),
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: AppImageRenderer.assets(Assets.imagesAncientWar))),
            ),
            Positioned.fill(
              bottom: 8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomSmoothPageIndicator(
                  controller: PageController(initialPage: 0),
                  dotHeight: 10,
                  dotWidth: 10,
                  unselectedColor: AppColors.white,
                  selectedColor: AppColors.deepGrey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
