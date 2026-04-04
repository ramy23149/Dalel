part of 'bazar_souvenirs_cubit.dart';

class BazarSouvenirsState {}

final class BazarSouvenirsInitial extends BazarSouvenirsState {}

final class BazarSouvenirsLoading extends BazarSouvenirsState {}

final class BazarSouvenirsSuccess extends BazarSouvenirsState {
  final List<SouvenirModel> souvenirs;
  BazarSouvenirsSuccess(this.souvenirs);
}

final class BazarSouvenirsFailure extends BazarSouvenirsState {
  final String errMessage;
  BazarSouvenirsFailure(this.errMessage);
}
