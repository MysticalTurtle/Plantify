import 'package:get_it/get_it.dart';
import 'package:recog_plantify/data/repositories/auth_repository_impl.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';
import 'package:recog_plantify/presentation/cubits/api_key/api_key_cubit.dart';

import 'data/datasources/auth_datasource.dart';
import 'data/repositories/api_key_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(authDataSource: sl()));
  sl.registerLazySingleton<ApiKeyCubit>(() => ApiKeyCubit(repository: sl()));

  //Data Sources
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<ApiKeyRepository>(() => ApiKeyRepositoryImpl(dataSource: sl()));
}