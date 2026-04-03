import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class BazarRepo {
  Future<Either<Failure,List<BookEntitie>>> getBazarBooks();
}