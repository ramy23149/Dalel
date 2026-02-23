import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    checkUserState();
  }

  Future<void> checkUserState() async {
    bool? onBoardingViewed =
        await getIt<SharedPrefHelper>().getOnBoardingViewed();
    bool isLogin = FirebaseAuth.instance.currentUser != null;
    // bool isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    await Future.delayed(const Duration(seconds: 2));

    if (onBoardingViewed != null && onBoardingViewed) {
      if (isLogin) {
        emit(NavigateToHome());
      } else {
        emit(NavigateToLoginView());
      }
    } else {
      emit(NavigateToOnboarding());
    }
  }
}
