import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/profile/presentation/widgets/custom_profile_item.dart';
import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppStrings.Account,
            style: AppTextStyles.heebo400style16,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CustomProfileItem(
          title: AppStrings.Edit_Profile,
          icon: Icons.person,
        ),
        CustomProfileItem(
          title: AppStrings.Notification,
          icon: Icons.notifications,
        ),
      ],
    );
  }
}
