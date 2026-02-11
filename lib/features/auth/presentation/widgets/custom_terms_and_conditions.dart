import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_text_button.dart';
import 'package:dalel_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTermsAndConditions extends StatefulWidget {
  const CustomTermsAndConditions({super.key});

  @override
  State<CustomTermsAndConditions> createState() =>
      _CustomTermsAndConditionsState();
}

class _CustomTermsAndConditionsState extends State<CustomTermsAndConditions> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = AuthCubit.get(context);
        return Row(
          children: [
            CustomCheckBox(
              onChange: (value) {
                cubit.onChangeTermsAndConditionsConfirmation();
              },
              value: cubit.isConfirmTermsAndConditions,
            ),
            GestureDetector(
              onTap: cubit.onChangeTermsAndConditionsConfirmation,
              child: Text(
                AppStrings.I_have_agree_to_our,
                style: AppTextStyles.poppins400style16,
              ),
            ),
            CustomTextBtn(
              text: AppStrings.Terms_and_Conditions,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              foregroundColor: AppColors.deepGrey,
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
