import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/core/routers/my_router.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';
import 'package:let_tutor/domain/usecases/ebook/get_list_ebooks.dart';
import 'package:let_tutor/firebase_options.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/l10n/l10n.dart';
import 'package:let_tutor/presentation/become-tutor/bloc/become_tutor_bloc.dart';
import 'package:let_tutor/presentation/booking/bloc/booking_bloc.dart';
import 'package:let_tutor/presentation/conversation/bloc/conversation_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/ebook_bloc.dart';
import 'package:let_tutor/presentation/details-course/bloc/course_details_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/review_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/edit-account/bloc/edit_account_bloc.dart';
import 'package:let_tutor/presentation/history/bloc/history_bloc.dart';
import 'package:let_tutor/presentation/home/bloc/home_course_bloc.dart'
    hide CourseFetching;
import 'package:let_tutor/presentation/home/bloc/home_ebook_bloc.dart'
    hide EbookFetching;
import 'package:let_tutor/presentation/home/bloc/home_tutor_bloc.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/messenger/bloc/message_bloc.dart';
import 'package:let_tutor/presentation/my-wallet/bloc/wallet_bloc.dart';
import 'package:let_tutor/presentation/schedule/bloc/schedule_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/total_lesson_time_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/upcoming_lesson_bloc.dart';
import 'package:let_tutor/services/socket_services.dart';
import 'package:let_tutor/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://204e21fa70a37ccd23878bb676b71a35@o4506638351597568.ingest.sentry.io/4506638356643840';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
  // try {
  //   int? test;
  //   test! + 1;
  // } catch (exception, stackTrace) {
  //   await Sentry.captureException(
  //     exception,
  //     stackTrace: stackTrace,
  //   );
  // }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final socketServices = sl<SocketServices>();

  @override
  void initState() {
    socketServices.connectToServer();
    super.initState();
  }

  @override
  void dispose() {
    socketServices.closeConnection();
    super.dispose();
  }

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
                  page: 1,
                  size: 5,
                  level: null,
                  categoryId: null,
                  order: null,
                  orderBy: null,
                  q: null,
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<EbookBloc>()
            ..add(
              EbookFetching(
                params: GetListEbooksUsecaseParams(
                  page: 1,
                  size: 5,
                  level: null,
                  categoryId: null,
                  order: null,
                  orderBy: null,
                  q: null,
                ),
              ),
            ),
        ),
        BlocProvider(create: (context) => sl<CourseDetailsBloc>()),
        BlocProvider(
          create: (context) => sl<HistoryBloc>()
            ..add(
              HistoryFetched(
                ScheduleParams(
                  page: 1,
                  perPage: 10,
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<ScheduleBloc>()
            ..add(
              ScheduleFetched(
                ScheduleParams(
                  page: 1,
                  perPage: 10,
                ),
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
        BlocProvider(
            create: (context) => sl<HomeEbookBloc>()..add(const FetchEbook())),
        BlocProvider(create: (context) => sl<BecomeTutorBloc>()),
        BlocProvider(
            create: (context) =>
                sl<MessageBloc>()..add(const GetListMessages())),
        BlocProvider(create: (context) => sl<ConversationBloc>()),
        BlocProvider(
          create: (context) => sl<WalletBloc>()
            ..add(
              const GetTransactionsEvent(),
            ),
        ),
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
