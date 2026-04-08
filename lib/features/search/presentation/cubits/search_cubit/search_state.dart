// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

class SearchState {
  final List<BookEntitie> booksList;
  final List<HistoricalPeriodsModel> historicalPeriodsList;
  final List<HistoricalCharacterModel> historicalCharactersList;
  final bool isLoading;

  SearchState({
    this.booksList = const [],
    this.historicalPeriodsList = const [],
    this.historicalCharactersList = const [],
    this.isLoading = false,
  });

  SearchState copyWith({
    List<BookEntitie>? booksList,
    List<HistoricalPeriodsModel>? historicalPeriodsList,
    List<HistoricalCharacterModel>? historicalCharactersList,
    bool? isLoading,
  }) {
    return SearchState(
      booksList: booksList ?? this.booksList,
      historicalPeriodsList:
          historicalPeriodsList ?? this.historicalPeriodsList,
      historicalCharactersList:
          historicalCharactersList ?? this.historicalCharactersList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
