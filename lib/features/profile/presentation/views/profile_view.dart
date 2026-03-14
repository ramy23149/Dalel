import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/profile/presentation/widgets/account_section.dart';
import 'package:dalel_app/features/profile/presentation/widgets/custom_profile_info_tile.dart';
import 'package:dalel_app/features/profile/presentation/widgets/general_settings_section.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 12,
                ),
                Text(
                  AppStrings.Profile,
                  style: AppTextStyles.poppins700style20,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomProfileInfoTile(),
                SizedBox(
                  height: 32,
                ),
                AccountSection(),
                SizedBox(
                  height: 32,
                ),
                GeneralSettingsSection()
              ],
            ),
          ),
        ],
      )),
    );
  }
}

