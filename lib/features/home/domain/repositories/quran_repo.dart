import 'package:clean_arc/core/errors/errors.dart';
import 'package:clean_arc/features/home/domain/entities/quran_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class QuranRepo {
  Future<Either<Failure, List<QuranEntity>>> getQuranData();
}
