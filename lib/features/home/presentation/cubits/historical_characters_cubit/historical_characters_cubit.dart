import 'package:dalel_app/features/home/data/models/historical_character_model/historical_character_model.dart';
import 'package:dalel_app/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'historical_characters_state.dart';

class HistoricalCharactersCubit extends Cubit<HistoricalCharactersState> {
  HistoricalCharactersCubit({required this.homeRepo}) : super(HistoricalCharactersInitial());
  final HomeRepo homeRepo;

  Future<void> getHistoricalCharacters() async {
    emit(HistoricalCharactersLoading());
    final result = await homeRepo.getHistoricalCharacters();
    result.fold(
        (err) => emit(HistoricalCharactersError(
              message: err.message,
            )),
        (historicalCharactersModelsList) => emit(HistoricalCharactersLoaded(
            historicalCharactersModels: historicalCharactersModelsList)));
  }
}
