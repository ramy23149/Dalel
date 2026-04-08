import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_read_more_text_widget.dart';
import 'package:flutter/material.dart';

class WarDetailsSection extends StatelessWidget {
  const WarDetailsSection({super.key, required this.warModel});
 final WarModel warModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 16),
        CustomHeaderText(text: "${AppStrings.about} ${warModel.name}"),
        SizedBox(height: 32),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomReadMoreTextWidget(
                  text:
                      warModel.description
                ),
              ),
              Expanded(
                child: AppImageRenderer.network(
                  warModel.image,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
