import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: const Offset(0, 4),
            blurRadius: 4,
          )
        ]
      ),
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          onSubmitted: (value) {
            
          },
          cursorColor: AppColors.white,
          cursorWidth: 2.18,
          cursorHeight: 18,
          style: AppTextStyles.poppins400style16,
          decoration: InputDecoration(
            
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.white,
            ),
            hintText: AppStrings.Search_deep_into_the_history,
            hintStyle: AppTextStyles.poppins400style16.copyWith(
              color: AppColors.white
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            
          ),
        ),
      ),
    );
  }
}
