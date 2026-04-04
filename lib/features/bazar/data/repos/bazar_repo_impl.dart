import 'dart:developer';

import 'package:dalel_app/core/errors/dio_failure.dart';
import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/bazar/data/data_sources/bazar_books_remote_data_source.dart';
import 'package:dalel_app/features/bazar/data/models/souvenir_model/souvenir_model.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/bazar/domain/repos/bazar_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BazarRepoImpl implements BazarRepo {
  final BazarBooksRemoteDataSource bazarBooksRemoteDataSource;

  BazarRepoImpl({required this.bazarBooksRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntitie>>> getBazarBooks() async {
    try {
      List<BookEntitie> booksList = await bazarBooksRemoteDataSource
          .getBazarBooks();
      return right(booksList);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else if (e is Response) {
        return left(ServerFailure.fromResponse(e));
      } else {
        return left(
          ServerFailure(message: 'oops there was an error, please try again'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<SouvenirModel>>> getBazarSouvenirs() {
    // TODO: implement getBazarSouvenirs
    throw UnimplementedError();
  }
}
