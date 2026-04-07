import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTermsAndConditions extends StatelessWidget {
  const CustomTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = SignUpCubit.get(context);
        return Row(
  children: [
    CustomCheckBox(
      
      onChange: (value) {
        cubit.onChangeTermsAndConditionsConfirmation();
      },
      value: cubit.isConfirmTermsAndConditions,
    ),
    Expanded(
      child: GestureDetector(
        onTap: cubit.onChangeTermsAndConditionsConfirmation,
        child: RichText(
          text: TextSpan(
            style: AppTextStyles.poppins400style16,
            children: [
              TextSpan(text: AppStrings.I_have_agree_to_our),
              TextSpan(
                text: ' '
              ),
              TextSpan(
                text: AppStrings.Terms_and_Conditions,
                style: AppTextStyles.poppins400style16.copyWith(
                  color: AppColors.deepGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);
      },
    );
  }
}
