import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/enums/historical_type_enum.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_characters_cubit/historical_characters_cubit.dart';
import 'package:dalel_app/features/home/presentation/cubits/wars_cubit/wars_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_home_view_appBar.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_characters_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_period_details_sectoin.dart';
import 'package:dalel_app/features/home/presentation/widgets/wars_details_sectoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriodDetailsView extends StatelessWidget {
  const HistoricalPeriodDetailsView({super.key, required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoricalCharactersCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..getHistoricalCharacters(),
        ),
        BlocProvider(
          create: (context) => WarsCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..getWars(
              docId: historicalPeriodsModel.id,
              warsCollectoin: khistoricalPeriodsCollection),
        ),
      ],
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          clipBehavior: Clip.none,
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
                  HistoricalPeriodDetailsSectoin(historicalPeriodsModel: historicalPeriodsModel,),
                  SizedBox(
                    height: 22,
                  ),
                  WarsDetailsSection(
                    title: historicalPeriodsModel.name,
                    historicalType: HistoricalType.historicalPeriod,
                  ),
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
