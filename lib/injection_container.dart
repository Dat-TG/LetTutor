import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:let_tutor/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/tutor/tutor_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/tutor_details/tutor_details_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/user/user_api_service.dart';
import 'package:let_tutor/data/repositories/auth/auth_repository.dart';
import 'package:let_tutor/data/repositories/tutor/tutor_repository.dart';
import 'package:let_tutor/data/repositories/tutor_details/tutor_details_repository.dart';
import 'package:let_tutor/data/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/repositories/tutor_details/tutor_details_repository.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';
import 'package:let_tutor/domain/usecases/auth/refresh_token.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/domain/usecases/tutor_details/get_tutor_details.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
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
  sl.registerSingleton<TutorApiService>(TutorApiService(sl()));
  sl.registerSingleton<TutorDetailsApiService>(TutorDetailsApiService(sl()));

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<TutorRepository>(TutorRepositoryImpl(sl()));
  sl.registerSingleton<TutorDetailsRepository>(
      TutorDetailsRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<RefreshTokenUsecase>(RefreshTokenUsecase(sl()));
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase(sl()));
  sl.registerSingleton<SearchTutorsUsecase>(SearchTutorsUsecase(sl()));
  sl.registerSingleton<GetTutorDetailsUsecase>(GetTutorDetailsUsecase(sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory<TutorBloc>(() => TutorBloc(sl()));
  sl.registerFactory<TutorDetailsBloc>(() => TutorDetailsBloc(sl()));
}
