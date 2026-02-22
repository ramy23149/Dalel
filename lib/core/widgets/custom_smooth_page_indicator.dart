import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller, required this.dotWidth, required this.dotHeight, required this.unselectedColor, required this.selectedColor,
  });

  final PageController controller;
  final double dotWidth, dotHeight;
  final Color unselectedColor, selectedColor;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect:  ExpandingDotsEffect(
        dotWidth: dotWidth,
        dotHeight: dotHeight,
        dotColor: unselectedColor,
        activeDotColor: selectedColor,
      ),
    );
  }
}
