import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/profile/presentation/widgets/custom_profile_item.dart';
import 'package:flutter/material.dart';

class GeneralSettingsSection extends StatelessWidget {
  const GeneralSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppStrings.General,
            style: AppTextStyles.heebo400style16,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CustomProfileItem(
          title: AppStrings.Settings,
          icon: Icons.settings,
        ),
        CustomProfileItem(
          title: AppStrings.Security,
          icon: Icons.security,
        ),
        CustomProfileItem(
          title: AppStrings.Privacy_Policy,
          icon: Icons.privacy_tip,
        ),
        CustomProfileItem(
          title: AppStrings.Log_Out,
          icon: Icons.logout,
        ),
      ],
    );
  }
}
