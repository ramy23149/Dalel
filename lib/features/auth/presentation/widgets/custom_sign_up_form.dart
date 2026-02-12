import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator.dart';
import 'package:dalel_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Column(
                spacing: 24,
                children: [
                  CustomFormTextField(
                    controller: cubit.firstNameController,
                    labelText: AppStrings.First_Name,
                  ),
                  CustomFormTextField(
                    controller: cubit.lastNameController,
                    labelText: AppStrings.Last_Name,
                  ),
                  CustomFormTextField(
                    controller: cubit.emailController,
                    labelText: AppStrings.Email_Address,
                  ),
                  CustomFormTextField(
                    controller: cubit.passwordController,
                    labelText: AppStrings.Password,
                    isPasswordTextField: true,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CustomTermsAndConditions(),
              SizedBox(
                height: 88,
              ), 
            state is SignUpLoading ? const CustomLoadingIndecator() :  CustomBotton(
                backgroundColor: cubit.isConfirmTermsAndConditions
                    ? AppColors.primaryColor
                    : AppColors.grey,
                text: AppStrings.Sign_Up,
                onPressed: cubit.isConfirmTermsAndConditions
                    ? () => cubit.validateForm()
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
