import 'package:clean_arc/config/themes/app_themes.dart';
import 'package:clean_arc/core/constants/app_string.dart';
import 'package:clean_arc/features/home/data/datasources/remoteDataSource/remote_data_source.dart';
import 'package:clean_arc/features/home/data/repositories/quran_repo_impl.dart';
import 'package:clean_arc/features/home/domain/usecases/get_quran_data_usecases.dart';
import 'package:clean_arc/features/home/presentation/cubit/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/router/app_router.dart';
import 'config/router/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getQuranData: GetQuranDataUsecases(
          quranRepo: QuranRepoImpl(
            remoteDataSource: RemoteDataSourceImpl(dio: Dio()),
          ),
        ),
      )..getQuranData(),
      child: MaterialApp(
        title: AppString.quranApp,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: RoutesName.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        onUnknownRoute: AppRouter.onUnknownRoute,
      ),
    );
  }
}
