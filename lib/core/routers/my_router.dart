import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:let_tutor/core/common/bottom_bar.dart';
import 'package:let_tutor/presentation/course/widgets/all_courses.dart';
import 'package:let_tutor/presentation/course/widgets/all_ebooks.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/history/history_screen.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';
import 'package:let_tutor/presentation/settings/settings_screen.dart';
import 'package:let_tutor/presentation/tutor/widgets/all_tutors.dart';
import 'package:let_tutor/utils/helpers.dart';

class MyRouter {
  static final router = GoRouter(
    // set the router to listen for changes to the loginState
    // refreshListenable: loginState,
    // Show debugging logs.
    debugLogDiagnostics: true,
    initialLocation: '/home',
    // Routes
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const BottomBar(),
      ),
      GoRoute(
        name: TutorDetails.routeName,
        path: '/tutor',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const TutorDetails(),
          );
        },
      ),
      GoRoute(
          name: AllTutors.routeName,
          path: '/',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AppBarNormal(
                      title: AppLocalizations.of(context)!.recommendedTutors),
                ),
                body: const SingleChildScrollView(
                  child: AllTutors(),
                ),
              ),
            );
          }),
      GoRoute(
        name: AllCourses.routeName,
        path: '/all-courses',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBarNormal(
                    title: AppLocalizations.of(context)!.recommendedCourses),
              ),
              body: const SingleChildScrollView(
                child: AllCourses(),
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: CourseDetails.routeName,
        path: '/courses',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const CourseDetails(),
          );
        },
      ),
      GoRoute(
        name: AllEbooks.routeName,
        path: '/all-ebooks',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBarNormal(
                    title: AppLocalizations.of(context)!.recommendedEbooks),
              ),
              body: const SingleChildScrollView(
                child: AllEbooks(),
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: LessonScreen.routeName,
        path: '/lesson',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const LessonScreen(),
          );
        },
      ),
      GoRoute(
        name: SettingsScreen.routeName,
        path: '/settings',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const SettingsScreen(),
          );
        },
      ),
      GoRoute(
        name: HistoryScreen.routeName,
        path: '/history',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const HistoryScreen(),
          );
        },
      ),
    ],
    // TODO: Add Error Handler
    // TODO Add Redirect
  );
}
