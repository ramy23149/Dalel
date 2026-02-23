import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/home/data/data_source/remote_data_source.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/home/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
      getHistoricalCharacters() {
    // TODO: implement getHistoricalCharacters
    throw UnimplementedError();
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
