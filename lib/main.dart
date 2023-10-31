import 'package:flutter/material.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/core/routers/my_router.dart';
import 'package:let_tutor/l10n/l10n.dart';
import 'package:let_tutor/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DarkModeProvider(),
        ),
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
    );
  }
}
