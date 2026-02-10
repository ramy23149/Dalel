import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
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
              CustomBotton(
                text: AppStrings.Sign_Up,
                onPressed: () => cubit.createUserWithEmailAndPassword(),
              ),
            ],
          ),
        );
      },
    );
  }
}
