import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HistoricalPeriodsModel>>
      getHistoricalPeriods();
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getHistoricalCharacters();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getHistoricalCharacters() {
    // TODO: implement getHistoricalCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<HistoricalPeriodsModel>>
      getHistoricalPeriods() async {
    var snapshot = await FirebaseFirestore.instance
        .collection(khistorical_periodsCollection)
        .get();

    return snapshot.docs
        .map((doc) => HistoricalPeriodsModel.fromQuerySnapshot(doc.data()))
        .toList();
  }
}
