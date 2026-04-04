import 'package:dalel_app/features/bazar/data/models/souvenir_model/souvenir_model.dart';
import 'package:dalel_app/features/bazar/domain/repos/bazar_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bazar_souvenirs_state.dart';

class BazarSouvenirsCubit extends Cubit<BazarSouvenirsState> {
  BazarSouvenirsCubit({required this.bazarRepo}) : super(BazarSouvenirsInitial());
  final BazarRepo bazarRepo;

  Future<void> getBazarSouvenirs() async {
    emit(BazarSouvenirsLoading());
    var result = await bazarRepo.getBazarSouvenirs();
    result.fold((failure) => emit(BazarSouvenirsFailure(failure.message)),
        (booksList) => emit(BazarSouvenirsSuccess(booksList)));
  }
}
