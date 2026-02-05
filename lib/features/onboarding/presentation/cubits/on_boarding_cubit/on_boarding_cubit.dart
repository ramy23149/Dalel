import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial()){
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
      ChangeOnBoardingState(index: index,),
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
