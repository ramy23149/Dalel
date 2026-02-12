import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/core/widgets/custom_text_button.dart';
import 'package:dalel_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:dalel_app/features/onboarding/presentation/widgets/custom_nav_bar.dart';
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
        bool isLast = cubit.currentPage == OnBoardingModel.onBoardingDataList.length - 1;
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  isLast
                      ? const SizedBox.shrink()
                      : CustomNavBar(cubit: cubit),
                  CustomOnboardingViewBody(),
                  SizedBox(
                    height: 88,
                  ),
                  CustomBotton(
                    text: isLast
                        ? AppStrings.Create_Account
                        : AppStrings.Next,
                    onPressed: () => cubit.nextPage(),
                  ),
                  SizedBox(height: 16),
                  isLast
                      ? Column(
                          children: [
                            CustomTextBtn(
                              text: AppStrings.Login_Now,
                              onPressed: () => cubit.goToLogin(),
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

