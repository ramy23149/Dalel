import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';


class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.cubit,
  });

  final OnBoardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => cubit.skip(context),
          child: Text(
            AppStrings.Skip,
            style: AppTextStyles.poppins400style16,
          ),
        ),
      );
  }
}
