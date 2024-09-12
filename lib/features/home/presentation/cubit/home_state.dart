part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<QuranEntity> quranEntity;

  const HomeSuccess({required this.quranEntity});
}

class HomeFailure extends HomeState {
  final String error;

  const HomeFailure({required this.error});
}
