import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_historical_periods_list_view.dart';
import 'package:dalel_app/features/bazar/data/repos/bazar_repo_impl.dart';
import 'package:dalel_app/features/bazar/presentation/cubits/bazar_books_cubit/bazar_books_cubit.dart';
import 'package:dalel_app/features/bazar/presentation/widgets/historical_books_section.dart';
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
              BazarBooksCubit(bazarRepo: getIt.get<BazarRepoImpl>())..getBazarBooks(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 12),
                    Text(
                      AppStrings.Bazar,
                      style: AppTextStyles.poppins700style20,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    CustomHeaderText(text: AppStrings.History_Books),
                    SizedBox(height: 20),
                    CustomHistoricalPeriodsListView(),
                    SizedBox(height: 32),
                    CustomHeaderText(text: AppStrings.History_Books),
                    SizedBox(height: 16),
                    HistoricalBooksSection(),
                    SizedBox(height: 32),
                    CustomHeaderText(text: AppStrings.Historical_Souvenirs),
                    SizedBox(height: 16),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

