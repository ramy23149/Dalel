import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_periods_cubit/historical_periods_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'historical_period_item.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text: AppStrings.Historical_periods,
        ),
        SizedBox(height: 16),
        BlocBuilder<HistoricalPeriodsCubit, HistoricalPeriodsState>(
          builder: (context, state) {
            if (state is HistoricalPeriodsLoading) {
              return const Center(
                child: CustomLoadingIndecator(),
              );
            } else if (state is HistoricalPeriodsLoaded) {
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.historicalPeriodsModels.length,
                  itemBuilder: (context, index) => HistoricalPeriodItem(
                    historicalPeriodsModel:
                        state.historicalPeriodsModels[index],
                  ),
                ),
              );
            } else if (state is HistoricalPeriodsError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.poppins400style16,
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
