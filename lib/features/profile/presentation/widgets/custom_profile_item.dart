import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: AppColors.deepBrown,
          ),
          title: Text(
            title,
            style:
                AppTextStyles.heebo400style16.copyWith(color: AppColors.deepBrown),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.deepBrown,
          ),
        ),
        Divider(
          thickness: 1,
          color: AppColors.light,
        ),
      ],
    );
  }
}
