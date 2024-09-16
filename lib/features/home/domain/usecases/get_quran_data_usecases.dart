import 'package:clean_arc/core/errors/errors.dart';
import 'package:clean_arc/features/home/domain/entities/quran_entity.dart';
import 'package:clean_arc/features/home/domain/repositories/quran_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/use_cases/use_cases.dart';

class GetQuranDataUsecases implements UseCases<List<QuranEntity>> {
  final QuranRepo quranRepo;

  GetQuranDataUsecases({required this.quranRepo});

  @override
  Future<Either<Failure, List<QuranEntity>>> call() async {
    return await quranRepo.getQuranData();
  }
}
