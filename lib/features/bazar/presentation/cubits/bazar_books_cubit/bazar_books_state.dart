part of 'bazar_books_cubit.dart';

class BazarBooksState {}

final class BazarBooksInitial extends BazarBooksState {}

final class BazarBooksLoading extends BazarBooksState {}

final class BazarBooksLoadedSuccessfully extends BazarBooksState {
  final List<BookEntitie> booksList;

  BazarBooksLoadedSuccessfully(this.booksList);
}

final class BazarBooksError extends BazarBooksState {
  final String errMessage;

  BazarBooksError(this.errMessage);
}
