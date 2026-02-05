import 'package:dalel_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_view_contant.dart';

class CustomOnboardingViewBody extends StatelessWidget {
  const CustomOnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = OnBoardingCubit.get(context);
        return Expanded(
          child: PageView.builder(
              onPageChanged: cubit.onPageChanged,
              controller: cubit.pageController,
              itemCount: OnBoardingModel.onBoardingDataList.length,
              itemBuilder: (context, index) {
                final item = OnBoardingModel.onBoardingDataList[index];
                return OnBoardingViewContant(item: item, cubit: cubit);
              }),
        );
      },
    );
  }
}

