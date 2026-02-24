part of 'historical_characters_cubit.dart';

 class HistoricalCharactersState {}

final class HistoricalCharactersInitial extends HistoricalCharactersState {}

final class HistoricalCharactersLoading extends HistoricalCharactersState {}

final class HistoricalCharactersLoaded extends HistoricalCharactersState {
  final List<HistoricalCharacterModel> historicalCharactersModels;
  HistoricalCharactersLoaded({required this.historicalCharactersModels});
}

final class HistoricalCharactersError extends HistoricalCharactersState {
  final String message;
  HistoricalCharactersError({required this.message});
}
