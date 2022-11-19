import 'package:get_it/get_it.dart';
import 'package:recog_plantify/data/repositories/auth_repository_impl.dart';

import 'data/datasources/auth_datasource.dart';
import 'domain/repositories/auth_repository.dart';
import 'presentation/modules/auth/cubit/auth_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(authDataSource: sl()));

  //Data Sources
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl()));
}