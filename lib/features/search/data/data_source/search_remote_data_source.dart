import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/api_serviece.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/features/bazar/data/models/book_model/book_model.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model/historical_periods_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<HistoricalCharacterModel>> getHistoricalCharactersByQuery(
    String query,
  );

  Future<List<HistoricalPeriodsModel>> getHistoricalPeriodsByQuery(
    String query,
  );

  Future<List<BookEntitie>> getBooksByQuery(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiServiece apiServiece;
  final FirebaseFirestore firestore;

  SearchRemoteDataSourceImpl({
    required this.apiServiece,
    required this.firestore,
  });

  @override
  Future<List<BookEntitie>> getBooksByQuery(String query) async {
    log("API IS CALLED");
    var books = await apiServiece.getSpecificBooks(query);
    List<BookEntitie> booksList = [];
    if(books.containsKey('items')){
  for (var book in books['items']) {
      booksList.add(BookModel.fromJson(book));
    }
    }
  
    return booksList;
  }

  @override
  Future<List<HistoricalCharacterModel>> getHistoricalCharactersByQuery(
    String query,
  ) async {
    var snapshot = await firestore
        .collection(khistoricalCharactersCollection)
        .get();

    List<HistoricalCharacterModel> matchedHistoricalCharacters = [];

    for (var doc in snapshot.docs) {
      HistoricalCharacterModel historicalCharacterModel =
          HistoricalCharacterModel.fromQuerySnapshot(doc.data());
      if (historicalCharacterModel.name.contains(query)) {
        matchedHistoricalCharacters.add(historicalCharacterModel);
      }
    }
    return matchedHistoricalCharacters;
  }

  @override
  Future<List<HistoricalPeriodsModel>> getHistoricalPeriodsByQuery(
    String query,
  ) async {
    var snapshot = await firestore
        .collection(khistoricalPeriodsCollection)
        .get();
    List<HistoricalPeriodsModel> matchedHistoricalPeriods = [];
    for (var doc in snapshot.docs) {
      HistoricalPeriodsModel historicalPeriodsModel =
          HistoricalPeriodsModel.fromQuerySnapshot(doc.data());
      if (historicalPeriodsModel.name.contains(query)) {
        matchedHistoricalPeriods.add(historicalPeriodsModel);
      }
    }
    return matchedHistoricalPeriods;
  }


}
