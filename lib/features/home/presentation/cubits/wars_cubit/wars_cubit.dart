import 'dart:developer';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';
import 'package:dalel_app/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wars_state.dart';

class WarsCubit extends Cubit<WarsState> {
  WarsCubit({required this.homeRepo}) : super(WarsInitial());
  final HomeRepo homeRepo;

  Future<void> getWars(
      {required String docId, required String warsCollectoin}) async {
        log("start");
    emit(WarsLoading());
    final result =
        await homeRepo.getWars(docId: docId, warsCollectoin: warsCollectoin);
    result.fold((err) => emit(WarsError(message: err.message)),
        (warsModelsList) {
             emit(WarsLoaded(wars: warsModelsList));
             log(warsModelsList.toString());
    });      

  }
}
