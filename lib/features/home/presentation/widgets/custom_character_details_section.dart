import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_read_more_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCharacterDetailsSection extends StatelessWidget {
  const CustomCharacterDetailsSection({
    super.key, required this.historicalCharacterModel,
  });
  final HistoricalCharacterModel historicalCharacterModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: "${AppStrings.about} ${historicalCharacterModel.name} (${historicalCharacterModel.birthYear}-${historicalCharacterModel.deathYear})"),
        SizedBox(
          height: 43,
        ),
        SizedBox(
          height: 280,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -20,
                      left: 18,
                      child: AppImageRenderer.assets(
                          Assets.imagesDetailsSmallCircle,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: -11,
                      left: -14,
                      child: AppImageRenderer.assets(
                        Assets.imagesDetailsBigCircle,
                      ),
                    ),
                    CustomReadMoreTextWidget(text: historicalCharacterModel.fullDescription),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -55,
                      right: -16,
                      child: AppImageRenderer.assets(
                          Assets.imagesCharacterEagle,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: -25,
                      right: 0,
                      child: AppImageRenderer.network(
                          historicalCharacterModel.homeImage!,
                          height: 285,
                          width: 160),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
