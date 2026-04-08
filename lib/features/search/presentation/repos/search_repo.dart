import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<void> saveSearchQueryToHive(String query);
  Future<String?> getSearchQueryFromHive();
  Either<Failure,List<HistoricalCharacterModel>> getHistoricalCharactersByQuery(String query);
  Either<Failure,List<HistoricalPeriodsModel>> getHistoricalPeriodsByQuery(String query);
  Either<Failure,List<BookEntitie>> getBooksByQuery(String query);
}