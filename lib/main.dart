import 'package:flutter/material.dart';
import 'package:let_tutor/l10n/l10n.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';
import 'package:let_tutor/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetTutor',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const CourseDetails(),
    );
  }
}
