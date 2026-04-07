import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    init();
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  late PageController pageController;
  init() {
    pageController = PageController(initialPage: 0);
  }

  final List<String> ancientWarsImages = [
    Assets.imagesHomePageView1,
    Assets.imagesHomePageView2,
    Assets.imagesHomePageView3,
  ];
  void onPageChanged(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
