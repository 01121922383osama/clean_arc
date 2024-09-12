import 'package:clean_arc/core/errors/errors.dart';
import 'package:clean_arc/features/home/data/datasources/remoteDataSource/remote_data_source.dart';
import 'package:clean_arc/features/home/domain/entities/quran_entity.dart';
import 'package:clean_arc/features/home/domain/repositories/quran_repo.dart';
import 'package:fpdart/fpdart.dart';

class QuranRepoImpl implements QuranRepo {
  final RemoteDataSource remoteDataSource;

  QuranRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<QuranEntity>>> getQuranData() async {
    return await remoteDataSource.getQuranData();
  }
}
