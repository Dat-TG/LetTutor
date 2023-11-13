import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/core/routers/my_router.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/l10n/l10n.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
            create: (_) => AuthProvider(),
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
