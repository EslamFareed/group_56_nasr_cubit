part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


class IncrementState extends HomeState{}
class DecrementState extends HomeState{}