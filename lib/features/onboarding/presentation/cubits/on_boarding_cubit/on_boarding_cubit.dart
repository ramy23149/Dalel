import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial()) {
    _init();
  }

  void _init() {
    pageController = PageController();
  }

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  late final PageController pageController;

  int currentPage = 0;

  void onPageChanged(int index) {
    currentPage = index;
    emit(
      ChangeOnBoardingState(
        index: index,
      ),
    );
  }

  Future<void> nextPage(BuildContext context) async {
    if (currentPage == OnBoardingModel.onBoardingDataList.length - 1) {
      await setOnBoardingViewed();
      customGoNavigation(context, AppRouter.kSignUpView);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  Future<void> skip(BuildContext context) async {
  await  setOnBoardingViewed();
   customGoNavigation(context, AppRouter.kSignUpView);
  }
 Future<void> goToLogin(BuildContext context) async{
   await  setOnBoardingViewed();
   customGoNavigation(context, AppRouter.kLogInView);
 }
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  Future<void> setOnBoardingViewed() async {
    await getIt<SharedPrefHelper>().setOnBoardingViewed(true);
  }
}
