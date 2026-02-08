import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/auth_questoin_action_row.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_terms_and_conditions.dart' show CustomTermsAndConditions;
import 'package:dalel_app/features/auth/presentation/widgets/custom_wellcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
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
            SliverToBoxAdapter(
                child: Column(
              spacing: 24,
              children: [
                CustomTextField(labelText: AppStrings.First_Name),
                CustomTextField(labelText: AppStrings.Last_Name),
                CustomTextField(labelText: AppStrings.Email_Address),
                CustomTextField(labelText: AppStrings.Password),
              ],
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTermsAndConditions(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 88,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomBotton(
                text: AppStrings.Sign_Up,
                onPressed: () {},
              ),
            ),
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
    );
  }
}
