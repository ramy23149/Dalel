import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/core/widgets/custom_text_button.dart';
import 'package:dalel_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:dalel_app/features/onboarding/presentation/widgets/custom_onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) { 
        final cubit = OnBoardingCubit.get(context);
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
                    child: GestureDetector(
                      onTap: () => cubit.skip(context),
                      child: Text(
                        AppStrings.Skip,
                        style: AppTextStyles.poppins400style16,
                      ),
                    ),
                  ),
                  CustomOnboardingViewBody(),
                  SizedBox(
                    height: 88,
                  ),
                  CustomBotton(
                    text: cubit.currentPage ==
                            OnBoardingModel.onBoardingDataList.length - 1
                        ? AppStrings.Create_Account
                        : AppStrings.Next,
                    onPressed: () => cubit.nextPage(context),
                  ),
                  SizedBox(height: 16),
                  cubit.currentPage ==
                          OnBoardingModel.onBoardingDataList.length - 1
                      ? Column(
                          children: [
                            CustomTextBtn(
                              text: AppStrings.Login_Now,
                              onPressed: () => cubit.goToLogin(context),
                            ),
                            SizedBox(height: 8),
                          ],
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
