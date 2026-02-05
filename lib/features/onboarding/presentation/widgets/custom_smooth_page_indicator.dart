import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.cubit,
  });

  final OnBoardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: cubit.pageController,
      count: 3,
      effect:  ExpandingDotsEffect(
        dotWidth: 10,
        dotHeight: 6,
        dotColor: AppColors.grey,
        activeDotColor: AppColors.deepBrown,
      ),
    );
  }
}
