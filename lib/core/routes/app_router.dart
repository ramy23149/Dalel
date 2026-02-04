import 'package:dalel_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:dalel_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kOnboardingView = '/OnboardingView';

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
        builder: (context, state) => OnboardingView(),
      )
    ],
  );
}
