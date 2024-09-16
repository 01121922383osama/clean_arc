import 'package:clean_arc/features/home/data/models/quran_models.dart';
import 'package:dio/dio.dart';

abstract interface class LocalDataSource {
  List<QuranModels> getQuranData();
}

class LocalDataSourceImpl implements LocalDataSource {
  final Dio dio;

  LocalDataSourceImpl({required this.dio});
  @override
  List<QuranModels> getQuranData() {
    return [];
  }
}
