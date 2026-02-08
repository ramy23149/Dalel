import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WellComeTextWidget extends StatelessWidget {
  const WellComeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.Welcome,
      style: AppTextStyles.poppins600style28,
      textAlign: TextAlign.center,
    );
  }
}
