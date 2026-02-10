import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/widgets/auth_questoin_action_row.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_wellcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 152,
                ),
              ),
              SliverToBoxAdapter(
                child: WellComeTextWidget(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              SliverToBoxAdapter(child: CustomSignUpForm()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: AuthQuestionActionRow(
                  question: AppStrings.Already_have_an_account,
                  answer: AppStrings.Sign_In,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

