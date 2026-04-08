import 'dart:developer';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/search/presentation/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchState());
  final SearchRepo searchRepo;

  Future<void> searchInRemoteDataSource({required String query}) async {
    emit(state.copyWith(isLoading: true));
    final books = await searchRepo.getBooksByQuery(query);

    books.fold(
      (failure) {
        showFlutterToast(message: failure.message);
        log(failure.message);
      },
      (books) {
        emit(state.copyWith(booksList: books));
      },
    );

    final characters = await searchRepo.getHistoricalCharactersByQuery(query);

    characters.fold(
      (failure) {
        showFlutterToast(message: failure.message);
        log(failure.message);
      },
      (characters) {
        emit(state.copyWith(historicalCharactersList: characters));
      },
    );

    final periods = await searchRepo.getHistoricalPeriodsByQuery(query);

    periods.fold(
      (failure) {
        showFlutterToast(message: failure.message);
        log(failure.message);
      },
      (periods) {
        emit(state.copyWith(historicalPeriodsList: periods));
      },
    );

    emit(state.copyWith(isLoading: false));
  }
}
