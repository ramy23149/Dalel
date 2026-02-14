import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/auth_questoin_action_row.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_login_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forgot_password_btn.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomWelcomeBanner(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  AppStrings.Welcome_Back,
                  style: AppTextStyles.poppins600style24,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 48,
                ),
                CustomLoginForm(),
                ForgotPasswordBtn(),
                SizedBox(
                  height: 102,
                ),
                CustomBotton(text: AppStrings.Sign_In, onPressed: () {}),
                AuthQuestionActionRow(
                    question: AppStrings.Do_not_have_an_account,
                    answer: AppStrings.Sign_Up,
                    onTap: () {})
              ],
            ),
          ),
        )
      ],
    ));
  }
}
