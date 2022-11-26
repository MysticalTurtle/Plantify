import 'package:get_it/get_it.dart';
import 'package:recog_plantify/data/repositories/auth_repository_impl.dart';

import 'data/datasources/auth_datasource.dart';
import 'data/repositories/send_email_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/verify_email_repository.dart';
import 'presentation/blocs/veify_email/send_email/send_email_cubit.dart';
import 'presentation/modules/auth/cubit/auth_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(authDataSource: sl()));
  sl.registerLazySingleton<SendEmailCubit>(() => SendEmailCubit(repository: sl()));

  //Data Sources
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<SendEmailRepository>(() => SendEmailRepositoryImpl(dataSource: sl()));
}