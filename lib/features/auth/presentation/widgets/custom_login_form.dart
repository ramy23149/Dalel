import 'package:dalel_app/core/functions/validate_email.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator.dart'
    show CustomLoadingIndecator;
import 'package:dalel_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forgot_password_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    CustomFormTextField(
                      validator: validatorEmail,
                      controller: cubit.emailController,
                      labelText: AppStrings.Email_Address,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomFormTextField(
                      controller: cubit.passwordController,
                      labelText: AppStrings.Password,
                      isPasswordTextField: true,
                    ),
                  
                  ],
                ),
              ),
            ),
              ForgotPasswordBtn(),
                    SizedBox(
                      height: 102,
                    ),
            state is LoginLoading
                ? CustomLoadingIndecator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomBotton(
                        text: AppStrings.Sign_In,
                        onPressed: cubit.validateFormAndLogin),
                  ),
          ],
        );
      },
    );
  }
}
