part of 'on_boarding_cubit.dart';


 class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

final class ChangeOnBoardingState extends OnBoardingState {
  final int index;
  ChangeOnBoardingState({ required this.index});
}
