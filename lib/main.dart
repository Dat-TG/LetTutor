import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/core/routers/my_router.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';
import 'package:let_tutor/domain/usecases/schedule/get_schedules.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/l10n/l10n.dart';
import 'package:let_tutor/presentation/booking/bloc/booking_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/details-course/bloc/course_details_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/review_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/edit-account/bloc/edit_account_bloc.dart';
import 'package:let_tutor/presentation/history/bloc/history_bloc.dart';
import 'package:let_tutor/presentation/home/bloc/home_course_bloc.dart'
    hide CourseFetching;
import 'package:let_tutor/presentation/home/bloc/home_tutor_bloc.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/schedule/bloc/schedule_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/total_lesson_time_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/upcoming_lesson_bloc.dart';
import 'package:let_tutor/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<TutorBloc>()),
        BlocProvider(create: (context) => sl<TutorDetailsBloc>()),
        BlocProvider(create: (context) => sl<ReviewBloc>()),
        BlocProvider(
            create: (context) =>
                sl<TotalLessonTimeBloc>()..add(const TotalLessonTimeFetched())),
        BlocProvider(
            create: (context) =>
                sl<UpcomingLessonBloc>()..add(const UpcomingLessonFetched())),
        BlocProvider(
          create: (context) => sl<CourseBloc>()
            ..add(
              CourseFetching(
                params: GetListCoursesUsecaseParams(
                  token:
                      sl<SharedPreferences>().getString('access-token') ?? "",
                  page: 1,
                  size: 5,
                ),
              ),
            ),
        ),
        BlocProvider(create: (context) => sl<CourseDetailsBloc>()),
        BlocProvider(
          create: (context) => sl<HistoryBloc>()
            ..add(
              HistoryFetched(
                GetSchedulesUsecaseParams(
                    page: 1,
                    perPage: 10,
                    token: sl<SharedPreferences>().getString('access-token') ??
                        ""),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<ScheduleBloc>()
            ..add(
              ScheduleFetched(
                GetSchedulesUsecaseParams(
                    page: 1,
                    perPage: 10,
                    token: sl<SharedPreferences>().getString('access-token') ??
                        ""),
              ),
            ),
        ),
        BlocProvider(create: (context) => sl<BookingBloc>()),
        BlocProvider(create: (context) => sl<EditAccountBloc>()),
        BlocProvider(
            create: (context) => sl<HomeTutorBloc>()..add(const FetchTutor())),
        BlocProvider(
            create: (context) =>
                sl<HomeCourseBloc>()..add(const FetchCourse())),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LocaleProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => DarkModeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => sl<AuthProvider>(),
          )
        ],
        builder: (context, child) {
          bool? isDark = Provider.of<DarkModeProvider>(context).isDarkModeOn;
          return MaterialApp.router(
            title: 'LetTutor',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: isDark == null
                ? ThemeMode.system
                : isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            locale: Provider.of<LocaleProvider>(context).locale,
            routerConfig: MyRouter.router,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
