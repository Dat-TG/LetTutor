import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:let_tutor/core/common/bottom_bar.dart';
import 'package:let_tutor/presentation/become-tutor/become_tutor_screen.dart';
import 'package:let_tutor/presentation/booking/book_lesson_screen.dart';
import 'package:let_tutor/presentation/conversation/conversation_screen.dart';
import 'package:let_tutor/presentation/course/widgets/all_courses.dart';
import 'package:let_tutor/presentation/course/widgets/all_ebooks.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/edit-account/edit_account_screen.dart';
import 'package:let_tutor/presentation/history/history_screen.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:let_tutor/presentation/messenger/messenger_screen.dart';
import 'package:let_tutor/presentation/my-wallet/my_wallet_screen.dart';
import 'package:let_tutor/presentation/settings/change_password_screen.dart';
import 'package:let_tutor/presentation/settings/settings_screen.dart';
import 'package:let_tutor/presentation/tutor/widgets/all_tutors.dart';
import 'package:let_tutor/presentation/welcome/welcome_screen.dart';
import 'package:let_tutor/utils/helpers.dart';

class MyRouter {
  static final router = GoRouter(
    // set the router to listen for changes to the loginState
    // refreshListenable: loginState,
    // Show debugging logs.
    debugLogDiagnostics: true,
    initialLocation: '/welcome',
    // Routes
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const BottomBar(
          tab: 0,
        ),
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
      GoRoute(
        name: EditAccountScreen.routeName,
        path: '/profile',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const EditAccountScreen(),
          );
        },
      ),
      GoRoute(
          name: BecomeTutorScreen.routeName,
          path: '/become-tutor',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const BecomeTutorScreen(),
            );
          }),
      GoRoute(
          name: BookLessonScreen.routeName,
          path: '/book-lesson',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const BookLessonScreen(),
            );
          }),
      GoRoute(
          name: LoginScreen.routeName,
          path: '/login',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const LoginScreen(),
            );
          }),
      GoRoute(
          name: WelcomeScreen.routeName,
          path: '/welcome',
          builder: (context, state) => const WelcomeScreen()),
      GoRoute(
          name: ChangePasswordScreen.routeName,
          path: '/change-password',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ChangePasswordScreen(),
            );
          }),
      GoRoute(
          name: MyWalletScreen.routeName,
          path: '/my-wallet',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const MyWalletScreen(),
            );
          }),
      GoRoute(
          name: MessengerScreen.routeName,
          path: '/messenger',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const MessengerScreen(),
            );
          }),
      GoRoute(
          name: ConversationScreen.routeName,
          path: '/conversation',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ConversationScreen(),
            );
          }),
    ],
    // TODO: Add Error Handler
    // TODO Add Redirect
  );
}
