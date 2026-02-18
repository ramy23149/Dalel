import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
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
                CustomFormTextField(labelText: AppStrings.Email_Address),
                  SizedBox(
                  height: 130,
                ),
                CustomBotton(
                  text: AppStrings.Send_Verification_Code,
                  textColor: AppColors.white,
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
  }
}
