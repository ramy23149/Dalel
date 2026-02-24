import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HistoricalPeriodsModel>> getHistoricalPeriods();
  Future<List<HistoricalCharacterModel>>
      getHistoricalCharacters();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<HistoricalCharacterModel>>
      getHistoricalCharacters()async {
    var snapshot = await FirebaseFirestore.instance
        .collection(khistoricalCharactersCollection)
        .get();

    List<HistoricalCharacterModel> historicalCharacters = snapshot.docs
        .map((doc) => HistoricalCharacterModel.fromQuerySnapshot(doc.data()))
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
