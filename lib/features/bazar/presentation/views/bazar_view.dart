import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/features/bazar/data/repos/bazar_repo_impl.dart';
import 'package:dalel_app/features/bazar/presentation/cubits/bazar_books_cubit/bazar_books_cubit.dart';
import 'package:dalel_app/features/bazar/presentation/cubits/bazar_souvenirs_cubit/bazar_souvenirs_cubit.dart';
import 'package:dalel_app/features/bazar/presentation/widgets/bazar_view_body.dart';
import 'package:dalel_app/features/bazar/presentation/widgets/custom_bazar_floating_action_button.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_periods_cubit/historical_periods_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BazarView extends StatelessWidget {
  const BazarView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HistoricalPeriodsCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..getHistoricalPeriods(),
        ),
        BlocProvider(
          create: (context) =>
              BazarBooksCubit(bazarRepo: getIt.get<BazarRepoImpl>())
                ..getBazarBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BazarSouvenirsCubit(bazarRepo: getIt.get<BazarRepoImpl>())
                ..getBazarSouvenirs(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: CustomBazarFloatingActionButton(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BazarViewBody(),
          ),
        ),
      ),
    );
  }
}

