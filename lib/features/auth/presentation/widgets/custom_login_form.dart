import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/functions/validate_email.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator.dart';

import 'package:dalel_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forgot_password_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomLoginForm extends HookWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          showFlutterToast(message: state.errMessage);
        } else if (state is LoginSuccess) {
          customReplaceNavigation(AppRouter.kHomeNavBarView);
        }
      },
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomFormTextField(
                      validator: validatorEmail,
                      controller: emailController,
                      labelText: AppStrings.Email_Address,
                    ),
                    SizedBox(height: 25),
                    CustomFormTextField(
                      controller: passwordController,
                      labelText: AppStrings.Password,
                      isPasswordTextField: true,
                    ),
                  ],
                ),
              ),
            ),
            ForgotPasswordBtn(),
            SizedBox(height: 102),
            state is LoginLoading
                ? CustomLoadingIndecator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomBotton(
                      text: AppStrings.Sign_In,
                      onPressed: () => cubit.login(
                        formKey: formKey,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
