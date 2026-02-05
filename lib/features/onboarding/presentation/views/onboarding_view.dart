import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/onboarding/presentation/widgets/custom_onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                AppStrings.Skip,
                style: AppTextStyles.poppins400style64,
              ),
            ),
            CustomOnboardingViewBody(),
          ],
        ),
      ),
    );
  }
}

