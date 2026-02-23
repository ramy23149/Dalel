import 'package:dalel_app/core/functions/validate_email.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator.dart';
import 'package:dalel_app/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = ResetPasswordCubit.get(context);
        return Scaffold(
            body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 108,
                    ),
                    Text(
                      AppStrings.Forgot_Password,
                      style: AppTextStyles.poppins600style24,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    AppImageRenderer.assets(Assets.imagesForgotPassword),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      AppStrings.enter_your_registered_email,
                      style: AppTextStyles.poppins400style14,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: cubit.formKey,
                      child: CustomFormTextField(
                        controller: cubit.emailController,
                        labelText: AppStrings.Email_Address,
                        validator: validatorEmail,
                      ),
                    ),
                    SizedBox(
                      height: 130,
                    ),
                    state is ResetPasswordLoading
                        ? const CustomLoadingIndecator()
                        : CustomBotton(
                            text: AppStrings.Send_Verification_Code,
                            textColor: AppColors.white,
                            onPressed: () => cubit.resetPassword(),
                          ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
