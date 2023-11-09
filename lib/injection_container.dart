import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:let_tutor/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/user/user_api_service.dart';
import 'package:let_tutor/data/repositories/auth/auth_repository.dart';
import 'package:let_tutor/data/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Shared Preferences
  sl.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance);
  await sl.isReady<SharedPreferences>();

  // Dependencies
  // API Services
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<UserApiService>(UserApiService(sl()));

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase(sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
}