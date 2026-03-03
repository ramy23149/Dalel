part of 'wars_cubit.dart';

 class WarsState {}

final class WarsInitial extends WarsState {}

final class WarsLoading extends WarsState {}

final class WarsLoaded extends WarsState {
  final List<WarModel> wars;
  WarsLoaded({required this.wars});
}

final class WarsError extends WarsState {
  final String message;
  WarsError({required this.message});
}
