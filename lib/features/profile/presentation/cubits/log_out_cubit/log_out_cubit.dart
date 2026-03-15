import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());
  static LogOutCubit get(context) => BlocProvider.of(context);

  Future<void> logOut() async {
    try {
      emit(LogOutLoading());
   await  FirebaseAuth.instance.signOut();
     emit(LogOutSuccess());
    } catch (e) {
      emit(LogOutError(errMessage:e.toString()));
    }
  }
}
