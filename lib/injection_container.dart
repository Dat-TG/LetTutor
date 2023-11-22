import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:let_tutor/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/course/course_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/course_details/course_details_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/review/review_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/schedule/schedule_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/total_lesson_time/total_lesson_time_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/tutor/tutor_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/tutor_details/tutor_details_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/upcoming_lesson/upcoming_lesson_api_service.dart';
import 'package:let_tutor/data/data_sources/remote/user/user_api_service.dart';
import 'package:let_tutor/data/repositories/auth/auth_repository.dart';
import 'package:let_tutor/data/repositories/course/course_repository.dart';
import 'package:let_tutor/data/repositories/course_details/course_details_repository.dart';
import 'package:let_tutor/data/repositories/review/review_repository.dart';
import 'package:let_tutor/data/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/data/repositories/total_lesson_time/total_lesson_time_repository.dart';
import 'package:let_tutor/data/repositories/tutor/tutor_repository.dart';
import 'package:let_tutor/data/repositories/tutor_details/tutor_details_repository.dart';
import 'package:let_tutor/data/repositories/upcoming_lesson/upcoming_lesson_repository.dart';
import 'package:let_tutor/data/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';
import 'package:let_tutor/domain/repositories/course/course_repository.dart';
import 'package:let_tutor/domain/repositories/course_details/course_details_repository.dart';
import 'package:let_tutor/domain/repositories/review/review_repository.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/domain/repositories/total_lesson_time/total_lesson_time_repository.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/repositories/tutor_details/tutor_details_repository.dart';
import 'package:let_tutor/domain/repositories/upcoming_lesson/upcoming_lesson_repository.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';
import 'package:let_tutor/domain/usecases/auth/refresh_token.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';
import 'package:let_tutor/domain/usecases/course_details/get_course_details.dart';
import 'package:let_tutor/domain/usecases/review/get_reviews.dart';
import 'package:let_tutor/domain/usecases/schedule/get_history.dart';
import 'package:let_tutor/domain/usecases/schedule/get_schedules.dart';
import 'package:let_tutor/domain/usecases/total_lesson_time/get_total_lesson_time.dart';
import 'package:let_tutor/domain/usecases/tutor/favorite_tutor.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/domain/usecases/tutor_details/get_tutor_details.dart';
import 'package:let_tutor/domain/usecases/upcoming_lesson/get_upcoming_lesson.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/presentation/course/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/details-course/bloc/course_details_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/review_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/history/bloc/history_bloc.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/total_lesson_time_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/upcoming_lesson_bloc.dart';
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
  sl.registerSingleton<ReviewApiService>(ReviewApiService(sl()));
  sl.registerSingleton<TotalLessonTimeApiService>(
      TotalLessonTimeApiService(sl()));
  sl.registerSingleton<UpcomingLessonApiService>(
      UpcomingLessonApiService(sl()));
  sl.registerSingleton<CourseApiService>(CourseApiService(sl()));
  sl.registerSingleton<CourseDetailsApiService>(CourseDetailsApiService(sl()));
  sl.registerSingleton<ScheduleApiService>(ScheduleApiService(sl()));

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<TutorRepository>(TutorRepositoryImpl(sl()));
  sl.registerSingleton<TutorDetailsRepository>(
      TutorDetailsRepositoryImpl(sl()));
  sl.registerSingleton<ReviewRepository>(ReviewRepositoryImpl(sl()));
  sl.registerSingleton<TotalLessonTimeRepository>(
      TotalLessonTimeRepositoryImpl(sl()));
  sl.registerSingleton<UpcomingLessonRepository>(
      UpcomingLessonRepositoryImpl(sl()));
  sl.registerSingleton<CourseRepository>(CourseRepositoryImpl(sl()));
  sl.registerSingleton<CourseDetailsRepository>(
      CourseDetailsRepositoryImpl(sl()));
  sl.registerSingleton<ScheduleRepository>(ScheduleRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<RefreshTokenUsecase>(RefreshTokenUsecase(sl()));
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase(sl()));
  sl.registerSingleton<SearchTutorsUsecase>(SearchTutorsUsecase(sl()));
  sl.registerSingleton<GetTutorDetailsUsecase>(GetTutorDetailsUsecase(sl()));
  sl.registerSingleton<GetReviewsUsecase>(GetReviewsUsecase(sl()));
  sl.registerSingleton<GetTotalLessonTimeUsecase>(
      GetTotalLessonTimeUsecase(sl()));
  sl.registerSingleton<GetUpcomingLessonUsecase>(
      GetUpcomingLessonUsecase(sl()));
  sl.registerSingleton<GetListCoursesUsecase>(GetListCoursesUsecase(sl()));
  sl.registerSingleton<GetCourseDetailsUsecase>(GetCourseDetailsUsecase(sl()));
  sl.registerSingleton<FavoriteTutorUsecase>(FavoriteTutorUsecase(sl()));
  sl.registerSingleton<GetSchedulesUsecase>(GetSchedulesUsecase(sl()));
  sl.registerSingleton<GetHistoryUsecase>(GetHistoryUsecase(sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory<TutorBloc>(() => TutorBloc(sl(), sl()));
  sl.registerFactory<TutorDetailsBloc>(() => TutorDetailsBloc(sl(), sl()));
  sl.registerFactory<ReviewBloc>(() => ReviewBloc(sl()));
  sl.registerFactory<TotalLessonTimeBloc>(() => TotalLessonTimeBloc(sl()));
  sl.registerFactory<UpcomingLessonBloc>(() => UpcomingLessonBloc(sl()));
  sl.registerFactory<CourseBloc>(() => CourseBloc(sl()));
  sl.registerFactory<CourseDetailsBloc>(() => CourseDetailsBloc(sl()));
  sl.registerFactory<HistoryBloc>(() => HistoryBloc(sl()));
}
