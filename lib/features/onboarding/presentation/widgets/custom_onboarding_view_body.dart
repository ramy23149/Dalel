import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';
//  import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomOnboardingViewBody extends StatelessWidget {
  const CustomOnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Column(
          children: [
            AppImageRenderer.assets(
              Assets.imagesOnbording1,
            ),
        //     SmoothPageIndicator(
        //   controller: PageController(initialPage: 0),
        //   count: 3,
        // )
          ],
        ),
      ),
    );
  }
}
