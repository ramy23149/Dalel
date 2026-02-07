import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
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

  void nextPage(BuildContext context) {
    if (currentPage == OnBoardingModel.onBoardingDataList.length - 1) {
      customGoNavigation(context, AppRouter.kSignUpView);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  void skip(BuildContext context) => customGoNavigation(context, AppRouter.kSignUpView);
 void goToLogin(BuildContext context) => customGoNavigation(context, AppRouter.kLogInView);
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
