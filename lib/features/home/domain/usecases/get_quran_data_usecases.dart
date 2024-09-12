import 'package:clean_arc/core/errors/errors.dart';
import 'package:clean_arc/features/home/domain/entities/quran_entity.dart';
import 'package:clean_arc/features/home/domain/repositories/quran_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetQuranDataUsecases {
  final QuranRepo quranRepo;

  GetQuranDataUsecases({required this.quranRepo});

  Future<Either<Failure, List<QuranEntity>>> call() async {
    return await quranRepo.getQuranData();
  }
}
