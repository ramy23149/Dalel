import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/errors/dio_failure.dart';
import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/core/errors/firebase_failure.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:dalel_app/features/search/presentation/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntitie>>> getBooksByQuery(
    String query,
  ) async {
    try {
      List<BookEntitie> filteredBooks = await searchRemoteDataSource
          .getBooksByQuery(query);
      return right(filteredBooks);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(message: 'oops there was an error, please try again'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<HistoricalCharacterModel>>>
  getHistoricalCharactersByQuery(String query) async {
    try {
      List<HistoricalCharacterModel> filterdHistoricalCharacters =
          await searchRemoteDataSource.getHistoricalCharactersByQuery(query);
      return right(filterdHistoricalCharacters);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseServerFailure.fromFireStore(e));
      } else {
        return left(FireBaseServerFailure.unexpectedError(e));
      }
    }
  }

  @override
  Future<Either<Failure, List<HistoricalPeriodsModel>>>
  getHistoricalPeriodsByQuery(String query) async{
    try {
      List<HistoricalPeriodsModel> filterdHistoricalPeriods =
          await searchRemoteDataSource.getHistoricalPeriodsByQuery(query);
      return right(filterdHistoricalPeriods);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseServerFailure.fromFireStore(e));
      } else {
        return left(FireBaseServerFailure.unexpectedError(e));
      }
    }
  }

  @override
  Future<String?> getSearchQueryFromHive() {
    // TODO: implement getSearchQueryFromHive
    throw UnimplementedError();
  }

  @override
  Future<void> saveSearchQueryToHive(String query) {
    // TODO: implement saveSearchQueryToHive
    throw UnimplementedError();
  }
}
