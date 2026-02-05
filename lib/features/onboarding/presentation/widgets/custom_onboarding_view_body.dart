import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_smooth_page_indicator.dart';

class CustomOnboardingViewBody extends StatelessWidget {
  const CustomOnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = OnBoardingCubit.get(context);
        return PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: cubit.onPageChanged,
            controller: cubit.pageController,
            itemCount: OnBoardingModel.onBoardingDataList.length,
            itemBuilder: (context, index) {
              final item = OnBoardingModel.onBoardingDataList[index];
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16),
                    Text(
                      item.description,
                      style: AppTextStyles.poppins300style16,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
