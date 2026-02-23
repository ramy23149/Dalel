import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is NavigateToOnboarding) {
          customGoNavigation(AppRouter.kOnboardingView);
        } else if (state is NavigateToLoginView) {
          customGoNavigation(AppRouter.kLogInView);
        } else if (state is NavigateToHome) {
          customGoNavigation(AppRouter.kHomeNavBarView);
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            AppStrings.appName,
            style: AppTextStyles.pacifico400style64,
          ),
        ),
      ),
    );
  }
}
