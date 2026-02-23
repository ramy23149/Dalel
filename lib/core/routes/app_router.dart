import 'package:dalel_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:dalel_app/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:dalel_app/features/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:dalel_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel_app/features/auth/presentation/views/log_in_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel_app/features/home/presentation/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/home_nav_bar_view.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/onboarding/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:dalel_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:dalel_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kOnboardingView = '/OnboardingView';
  static const String kSignUpView = '/SignUpView';
  static const String kLogInView = '/LogInView';
  static const String kHomeView = '/HomeVeiw';
  static const String kForgotPasswordView = '/ForgotPasswordView';
  static const String kHomeNavBarView = '/HomeNavBarView';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(),
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: OnboardingView(),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(),
          child: SignUpView(),
        ),
      ),
      GoRoute(
        path: kLogInView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: LogInView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: kHomeNavBarView,
        builder: (context, state) => BlocProvider(
          create: (context) => NavBarCubit(),
          child: HomeNavBarView(),
        ),
      ),
    ],
  );
}
