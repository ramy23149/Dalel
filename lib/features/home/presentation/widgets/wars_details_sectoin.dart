import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_war_item.dart';
import 'package:flutter/material.dart';

class WarsDetailsSection extends StatelessWidget {
  const WarsDetailsSection({super.key, required this.warsModels});
  final List<WarModel> warsModels;
  @override
  Widget build(BuildContext context) {
    print(warsModels.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text: "Acient Egypt ${AppStrings.Wars}",
        ),
        SizedBox(
          height: 16,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -48,
                right: 0,
                child: AppImageRenderer.assets(Assets.imagesDetailsPharaoh)),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: warsModels.length,
                itemBuilder: (context, index) => HistoricalWarItem(
                  warModel: warsModels[index],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
