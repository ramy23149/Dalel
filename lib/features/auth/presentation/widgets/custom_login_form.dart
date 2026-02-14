import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        child: Column(
          children: [
            CustomFormTextField(labelText: AppStrings.Email_Address),
            SizedBox(
              height: 25,
            ),
            CustomFormTextField(
              labelText: AppStrings.Password,
              isPasswordTextField: true,
            ),
          
          ],
        ),
      ),
    );
  }
}
