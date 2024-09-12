import 'dart:developer';

import 'package:clean_arc/core/constants/app_string.dart';
import 'package:clean_arc/core/errors/errors.dart';
import 'package:clean_arc/features/home/data/models/quran_models.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RemoteDataSource {
  Future<Either<Failure, List<QuranModels>>> getQuranData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});
  @override
  Future<Either<Failure, List<QuranModels>>> getQuranData() async {
    final response = await dio.get(AppString.apiQuran);
    final data = response.data['items'] as List<dynamic>;
    log(response.data.toString());
    final result = data.map((item) => QuranModels.fromJson(item)).toList();
    log(result[0].authors.toString());
    return Right(result);
  }
}
