import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/profile/presentation/cubits/log_out_cubit/log_out_cubit.dart';
import 'package:dalel_app/features/profile/presentation/widgets/account_section.dart';
import 'package:dalel_app/features/profile/presentation/widgets/custom_profile_info_tile.dart';
import 'package:dalel_app/features/profile/presentation/widgets/general_settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(),
      child: BlocBuilder<LogOutCubit, LogOutState>(
        builder: (context, state) {
          if (state is LogOutSuccess) {
             customGoNavigation(AppRouter.kLogInView);
          }else if (state is LogOutError) {
            showFlutterToast(message: state.errMessage);
          }
          LogOutCubit logOutCubit = LogOutCubit.get(context);
          return ModalProgressHUD(
            inAsyncCall: state is LogOutLoading,
            child: SafeArea(
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
                        GeneralSettingsSection(
                          logOutCubit: logOutCubit,
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
