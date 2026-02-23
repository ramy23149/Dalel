part of 'historical_periods_cubit.dart';

class HistoricalPeriodsState {}

final class HistoricalPeriodsInitial extends HistoricalPeriodsState {}

final class HistoricalPeriodsLoading extends HistoricalPeriodsState {}

final class HistoricalPeriodsLoaded extends HistoricalPeriodsState {
  final List<HistoricalPeriodsModel> historicalPeriodsModels;
  HistoricalPeriodsLoaded({required this.historicalPeriodsModels});
}

final class HistoricalPeriodsError extends HistoricalPeriodsState {
  final String message;
  HistoricalPeriodsError({required this.message});
}
