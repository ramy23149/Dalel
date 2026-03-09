import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomRecentSearchItem extends StatelessWidget {
  const CustomRecentSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: const Offset(0,5),
            blurRadius: 10,
          )
        ]
      ),
      child: Text(
        "Salaheldin",
        style: AppTextStyles.poppins400style12,
      ),
    );
  }
}


