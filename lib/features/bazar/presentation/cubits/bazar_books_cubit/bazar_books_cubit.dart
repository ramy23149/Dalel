
import 'package:dalel_app/features/bazar/domain/entities/book_entitie.dart';
import 'package:dalel_app/features/bazar/domain/repos/bazar_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bazar_books_state.dart';

class BazarBooksCubit extends Cubit<BazarBooksState> {
  BazarBooksCubit({required this.bazarRepo}) : super(BazarBooksInitial());
  final BazarRepo bazarRepo;
 

  Future<void> getBazarBooks() async {
    emit(BazarBooksLoading());
    var result = await bazarRepo.getBazarBooks();
    result.fold(
      (failure) => emit(BazarBooksError(failure.message)),
      (booksList) => emit(BazarBooksLoadedSuccessfully(booksList)),
    );
  }


}
