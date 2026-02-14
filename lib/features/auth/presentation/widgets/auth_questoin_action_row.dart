import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class AuthQuestionActionRow extends StatelessWidget {
  const AuthQuestionActionRow({super.key, required this.question, required this.answer, this.onTap});
 final String question,answer;
 final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppTextStyles.poppins400style12,
        ),
        CustomTextBtn(
          enableUnderLine: false,
          text: answer,
          foregroundColor: AppColors.lightGrey,
          onPressed: onTap,
        ),
      ],
    );
  }
}
