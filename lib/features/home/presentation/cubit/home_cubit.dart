import 'package:clean_arc/features/home/domain/entities/quran_entity.dart';
import 'package:clean_arc/features/home/domain/usecases/get_quran_data_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetQuranDataUsecases _getQuranDataUsecases;
  HomeCubit({required GetQuranDataUsecases getQuranData})
      : _getQuranDataUsecases = getQuranData,
        super(HomeInitial());

  void getQuranData() async {
    emit(HomeLoading());
    final result = await _getQuranDataUsecases.call();
    result.fold((l) => emit(HomeFailure(error: l.toString())),
        (r) => emit(HomeSuccess(quranEntity: r)));
  }
}
