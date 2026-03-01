import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HistoricalPeriodsModel>> getHistoricalPeriods();
  Future<List<HistoricalCharacterModel>> getHistoricalCharacters();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<HistoricalCharacterModel>> getHistoricalCharacters() async {
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

    List<Future<HistoricalPeriodsModel>> historicalPeriods = snapshot.docs.map((doc)async {
      List<WarModel> wars =await getWars(doc.id);
      return HistoricalPeriodsModel.fromQuerySnapshot(doc.data(),wars);
    }).toList();
    return await Future.wait(historicalPeriods);
  }
  Future<List<WarModel>> getWars(String id)async{
    var snapshot = await FirebaseFirestore.instance
        .collection(khistoricalCharactersCollection)
        .doc(id)
        .collection(kWars)
        .get();
    List<WarModel> wars = snapshot.docs.map((doc) {
      return WarModel.fromJson(doc.data());
    }).toList();
    return wars;
  }
}
