import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()){
    checkUserState();
  }

  Future<void> checkUserState() async {
    bool? onBoardingViewed = await getIt<SharedPrefHelper>().getOnBoardingViewed();
    if (onBoardingViewed != null && onBoardingViewed) {
      await Future.delayed(const Duration(seconds: 2));
      emit(NavigateToSignUp());
    }else{
      await Future.delayed(const Duration(seconds: 2));
      emit(NavigateToOnboarding());
    }
  }
}
