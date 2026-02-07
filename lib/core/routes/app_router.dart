import 'package:dalel_app/features/auth/presentation/views/log_in_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_up_view.dart';
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
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: kLogInView,
        builder: (context, state) => LogInView(),
      ),
    ],
  );
}
