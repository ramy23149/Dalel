import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_characters_cubit/historical_characters_cubit.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_periods_cubit/historical_periods_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_ancient_wars_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_home_view_appBar.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_characters_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_periods_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
              HistoricalCharactersCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..getHistoricalCharacters(),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(height: 78),
                CustomHomeViewAppBar(),
                SizedBox(height: 32),
                HistoricalPeriodsSection(),
                SizedBox(height: 32),
                HistoricalCharactersSection(headerText: AppStrings.historical_characters,),
                SizedBox(height: 32),
                HomeAncientWarsSection(),
                SizedBox(height: 32),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
