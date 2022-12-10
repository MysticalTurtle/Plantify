import 'package:get_it/get_it.dart';
import 'package:recog_plantify/data/datasources/credits_datasource.dart';
import 'package:recog_plantify/data/repositories/auth_repository_impl.dart';
import 'package:recog_plantify/data/repositories/historial_repository_impl.dart';
import 'package:recog_plantify/data/repositories/recognition_repository_impl.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';
import 'package:recog_plantify/domain/repositories/historial_repository.dart';
import 'package:recog_plantify/domain/repositories/recognition_repository.dart';
import 'package:recog_plantify/presentation/cubits/api_key/api_key_cubit.dart';

import 'data/datasources/api_key_datasource.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/datasources/historial_datasource.dart';
import 'data/datasources/recognition_datasource.dart';
import 'data/repositories/api_key_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(authRepository: sl()));
  sl.registerLazySingleton<ApiKeyCubit>(() => ApiKeyCubit(repository: sl()));

  //Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<ApiKeyRepository>(() => ApiKeyRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<HistorialRepository>(() => HistorialRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<RecognitionRepository>(() => RecognitionRepositoryImpl(plantDataSource: sl(), creditsDataSource: sl()));

  //Data Sources
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  sl.registerLazySingleton<ApiKeyDataSource>(() => ApiKeyDataSourceImpl());
  sl.registerLazySingleton<HistorialDataSource>(() => HistorialDataSourceImpl());
  sl.registerLazySingleton<RecognitionDataSource>(() => RecognitionDataSourceImpl());
  sl.registerLazySingleton<CreditsDataSource>(() => CreditsDataSourceImpl());
}