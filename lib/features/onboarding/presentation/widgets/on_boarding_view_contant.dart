import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';

import 'custom_smooth_page_indicator.dart';

class OnBoardingViewContant extends StatelessWidget {
  const OnBoardingViewContant({
    super.key,
    required this.item,
    required this.cubit,
  });

  final OnBoardingModel item;
  final OnBoardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppImageRenderer.assets(
          item.image,
        ),
        SizedBox(height: 24),
        CustomSmoothPageIndicator(cubit: cubit),
        SizedBox(height: 32),
        Text(
          item.title,
          style: AppTextStyles.poppins500style24
              .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          item.description,
          style: AppTextStyles.poppins300style16,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        CustomBotton(text: AppStrings.Next),
      ],
    );
  }
}
