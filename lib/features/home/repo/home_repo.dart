import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/home/data/models/historical_character/historical_character.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HistoricalPeriodsModel>>> getHistoricalPeriods();
  Future<Either<Failure, List<HistoricalCharacter>>>
      getHistoricalCharacters();
}
