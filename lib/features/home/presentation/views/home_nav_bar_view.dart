import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/home/presentation/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeNavBarView extends StatelessWidget {
  const HomeNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        final cubit = NavBarCubit.get(context);
        return PersistentTabView(
          context,
          controller: cubit.controller,
          screens: cubit.buildScreens(),
          items: cubit.navBarItems(),
          backgroundColor: AppColors.primaryColor,
          navBarStyle: NavBarStyle.style6,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            colorBehindNavBar: Colors.white,
          ),
        );
      },
    );
  }
}
