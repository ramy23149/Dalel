import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/features/home/data/models/historical_character/historical_character.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HistoricalPeriodsModel>> getHistoricalPeriods();
  Future<List<HistoricalCharacter>>
      getHistoricalCharacters();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<HistoricalCharacter>>
      getHistoricalCharacters()async {
    var snapshot = await FirebaseFirestore.instance
        .collection(khistoricalCharactersCollection)
        .get();

    List<HistoricalCharacter> historicalCharacters = snapshot.docs
        .map((doc) => HistoricalCharacter.fromQuerySnapshot(doc.data()))
        .toList();
    return historicalCharacters;
  }

  @override
  Future<List<HistoricalPeriodsModel>> getHistoricalPeriods() async {
    var snapshot = await FirebaseFirestore.instance
        .collection(khistoricalPeriodsCollection)
        .get();

    List<HistoricalPeriodsModel> historicalPeriods = snapshot.docs
        .map((doc) => HistoricalPeriodsModel.fromQuerySnapshot(doc.data()))
        .toList();
    return historicalPeriods;
  }
}
