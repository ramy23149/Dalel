import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/api_serviece.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/features/bazar/data/models/book_model/book_model.dart';
import 'package:dalel_app/features/bazar/data/models/souvenir_model/souvenir_model.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';

abstract class BazarRemoteDataSource {
  Future<List<BookEntitie>> getBazarBooks();
  Future<List<SouvenirModel>> getBazarSouvenirs();
}

class BazarBooksRemoteDataSourceImpl implements BazarRemoteDataSource {
  final ApiServiece apiServiece;

  BazarBooksRemoteDataSourceImpl(this.apiServiece);
  @override
  Future<List<BookEntitie>> getBazarBooks() async {
    log("API IS CALLED");
    var books = await apiServiece.getBooks();
    List<BookEntitie> booksList = [];
    for (var book in books['items']) {
      booksList.add(BookModel.fromJson(book));
    }
    return booksList;
  }

  @override
  Future<List<SouvenirModel>> getBazarSouvenirs() async {
    var snapshot = await FirebaseFirestore.instance
        .collection(khistoricalSouvenirsCollection)
        .get();

    List<SouvenirModel> souvenirs = snapshot.docs.map((doc) {
      return SouvenirModel.fromQuerySnapshot(doc.data());
    }).toList();
    return souvenirs;
  }
}
