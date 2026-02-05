import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/onboarding/presentation/widgets/custom_onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  AppStrings.Skip,
                  style: AppTextStyles.poppins400style16,
                ),
              ),
              Expanded(child: CustomOnboardingViewBody()),
              SizedBox(height: 88,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomBotton(text: AppStrings.Next),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
