import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_characters_cubit/historical_characters_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_home_view_appBar.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_characters_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_period_details_sectoin.dart';
import 'package:dalel_app/features/home/presentation/widgets/wars_details_sectoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriodDetailsView extends StatelessWidget {
  const HistoricalPeriodDetailsView({super.key, required this.warsModels});
  final List<WarModel> warsModels;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoricalCharactersCubit(
        homeRepo: getIt.get<HomeRepoImpl>(),
      )..getHistoricalCharacters(),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 72,
                  ),
                  CustomHomeViewAppBar(),
                  SizedBox(
                    height: 7,
                  ),
                  HistoricalPeriodDetailsSectoin(),
                  SizedBox(
                    height: 22,
                  ),
                  WarsDetailsSection(warsModels: warsModels,),
                  SizedBox(
                    height: 24,
                  ),
                  HistoricalCharactersSection(
                    headerText: AppStrings.Recommendations,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
