import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/features/cart/presentation/views/cart_view.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/profile/presentation/views/profile_view.dart';
import 'package:dalel_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial()) {
    _init();
  }

  static NavBarCubit get(context) => BlocProvider.of(context);

  late final PersistentTabController controller;

  void _init() {
    controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> buildScreens() {
    return [
      HomeView(),
      CartView(),
      SearchView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: AppImageRenderer.assets(Assets.imagesActiveHome),
        inactiveIcon: AppImageRenderer.assets(Assets.imagesInactiveHome),
      ),
      PersistentBottomNavBarItem(
        icon: AppImageRenderer.assets(Assets.imagesActiveShoppingCart),
        inactiveIcon:
            AppImageRenderer.assets(Assets.imagesInactiveShoppingCart),
      ),
      PersistentBottomNavBarItem(
        icon: AppImageRenderer.assets(Assets.imagesActiveSearch),
        inactiveIcon: AppImageRenderer.assets(Assets.imagesInaciteveSearch),
      ),
      PersistentBottomNavBarItem(
        icon: AppImageRenderer.assets(Assets.imagesActievePerson),
        inactiveIcon: AppImageRenderer.assets(Assets.imagesInacitvePerson),
      ),
    ];
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
