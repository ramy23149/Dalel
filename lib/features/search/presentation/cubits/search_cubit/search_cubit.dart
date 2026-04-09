import 'dart:developer';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/search/presentation/repos/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchState()) {
    _init();
  }
  late TextEditingController searchController;
  final SearchRepo searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);
  List<BookEntitie> _filteredBooks = [];
  List<HistoricalCharacterModel> _filteredCharacters = [];
  List<HistoricalPeriodsModel> _filteredPeriods = [];

  void _init() {
    searchController = TextEditingController();
  }

  Future<void> searchInRemoteDataSource({required String query}) async {
    emit(state.copyWith(isLoading: true));
    final books = await searchRepo.getBooksByQuery(query);

    books.fold(
      (failure) {
        showFlutterToast(message: failure.message);
        log(failure.message);
      },
      (books) {
        _filteredBooks = books;
      },
    );

    final characters = await searchRepo.getHistoricalCharactersByQuery(query);
    log(characters.toString());
    characters.fold(
      (failure) {
        showFlutterToast(message: failure.message);
        log(failure.message);
      },
      (characters) {
        _filteredCharacters = characters;
      },
    );

    final periods = await searchRepo.getHistoricalPeriodsByQuery(query);
    log(periods.toString());
    periods.fold(
      (failure) {
        showFlutterToast(message: failure.message);
        log(failure.message);
      },
      (periods) {
        _filteredPeriods = periods;
      },
    );

    emit(
      state.copyWith(
        isLoading: false,
        booksList: _filteredBooks,
        historicalPeriodsList: _filteredPeriods,
        historicalCharactersList: _filteredCharacters,
      ),
    );
  }
}
