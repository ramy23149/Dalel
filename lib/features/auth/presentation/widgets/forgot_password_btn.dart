import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.topRight,
          child: CustomTextBtn(
            text: AppStrings.Forgot_Password,
            enableUnderLine: false,
            style: AppTextStyles.poppins600style12.copyWith(
              color: AppColors.deepGrey,
            ),
            onPressed: () => customPushNavigation(AppRouter.kForgotPasswordView),
          ),
        );
  }
}
