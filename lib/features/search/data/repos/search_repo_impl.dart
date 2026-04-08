import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/search/presentation/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Either<Failure, List<BookEntitie>> getBooksByQuery(String query) {
    // TODO: implement getBooksByQuery
    throw UnimplementedError();
  }

  @override
  Either<Failure, List<HistoricalCharacterModel>> getHistoricalCharactersByQuery(String query) {
    // TODO: implement getHistoricalCharactersByQuery
    throw UnimplementedError();
  }

  @override
  Either<Failure, List<HistoricalPeriodsModel>> getHistoricalPeriodsByQuery(String query) {
    // TODO: implement getHistoricalPeriodsByQuery
    throw UnimplementedError();
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