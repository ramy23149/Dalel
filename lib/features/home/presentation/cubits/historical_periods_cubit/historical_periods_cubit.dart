import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'historical_periods_state.dart';

class HistoricalPeriodsCubit extends Cubit<HistoricalPeriodsState> {
  HistoricalPeriodsCubit({required this.homeRepo})
      : super(HistoricalPeriodsInitial());
  final HomeRepo homeRepo;

  Future<void> getHistoricalPeriods() async {
    emit(HistoricalPeriodsLoading());
    final result = await homeRepo.getHistoricalPeriods();
    result.fold(
        (err) => emit(HistoricalPeriodsError(
              message: err.message,
            )),
        (historicalPeriodsModelsList) => emit(HistoricalPeriodsLoaded(
            historicalPeriodsModels: historicalPeriodsModelsList)));
  }
}
