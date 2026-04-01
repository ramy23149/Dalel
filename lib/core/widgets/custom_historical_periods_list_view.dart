import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator_list.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_periods_cubit/historical_periods_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHistoricalPeriodsListView extends StatelessWidget {
  const CustomHistoricalPeriodsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalPeriodsCubit, HistoricalPeriodsState>(
      builder: (context, state) {
        if (state is HistoricalPeriodsLoading) {
        return CustomLoadingIndecatorList(wideContainer: true,);
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
    );
  }
}
