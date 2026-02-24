import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/home/data/data_source/remote_data_source.dart';
import 'package:dalel_app/features/home/data/models/historical_character/historical_character.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/home/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<HistoricalCharacter>>>
      getHistoricalCharacters()async {
    try {
      List<HistoricalCharacter> historicalCharacters =
          await homeRemoteDataSource.getHistoricalCharacters();

      return Right(historicalCharacters);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFireStore(e));
      } else {
        return left(ServerFailure.unexpectedError(e));
      }
    }
  }

  @override
  Future<Either<Failure, List<HistoricalPeriodsModel>>>
      getHistoricalPeriods() async {
    try {
      List<HistoricalPeriodsModel> historicalPeriods =
          await homeRemoteDataSource.getHistoricalPeriods();

      return Right(historicalPeriods);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFireStore(e));
      } else {
        return left(ServerFailure.unexpectedError(e));
      }
    }
  }
}
