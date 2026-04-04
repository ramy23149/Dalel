import 'dart:developer';

import 'package:dalel_app/core/utils/api_serviece.dart';
import 'package:dalel_app/features/bazar/data/models/book_model/book_model.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';

abstract class BazarBooksRemoteDataSource {
  Future<List<BookEntitie>> getBazarBooks();
}

class BazarBooksRemoteDataSourceImpl implements BazarBooksRemoteDataSource {
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
}
