import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/data/login_repo_impl.dart';
import 'package:dalel_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:dalel_app/features/auth/presentation/widgets/auth_questoin_action_row.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_login_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => LoginCubit(loginRepo: getIt.get<LoginRepoImpl>()),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  CustomWelcomeBanner(),
                  SizedBox(height: 32),
                  Column(
                    children: [
                      Text(
                        AppStrings.Welcome_Back,
                        style: AppTextStyles.poppins600style24,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 48),
                      CustomLoginForm(),
                      AuthQuestionActionRow(
                        question: AppStrings.Do_not_have_an_account,
                        answer: AppStrings.Sign_Up,
                        onTap: () =>
                            customReplaceNavigation(AppRouter.kSignUpView),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
