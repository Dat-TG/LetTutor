import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:let_tutor/core/common/bottom_bar.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';
import 'package:let_tutor/presentation/become-tutor/become_tutor_screen.dart';
import 'package:let_tutor/presentation/booking/book_lesson_screen.dart';
import 'package:let_tutor/presentation/conversation/conversation_screen.dart';
import 'package:let_tutor/presentation/course/widgets/all_courses.dart';
import 'package:let_tutor/presentation/course/widgets/all_ebooks.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/edit-account/edit_account_screen.dart';
import 'package:let_tutor/presentation/forgot-password/forgot_password_screen.dart';
import 'package:let_tutor/presentation/history/history_screen.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:let_tutor/presentation/messenger/messenger_screen.dart';
import 'package:let_tutor/presentation/my-wallet/my_wallet_screen.dart';
import 'package:let_tutor/presentation/my-wallet/transactions_screen.dart';
import 'package:let_tutor/presentation/register/register_screen.dart';
import 'package:let_tutor/presentation/search/search_screen.dart';
import 'package:let_tutor/presentation/settings/change_password_screen.dart';
import 'package:let_tutor/presentation/settings/settings_screen.dart';
import 'package:let_tutor/presentation/tutor/all_tutors_screen.dart';
import 'package:let_tutor/presentation/tutor/tutor_screen.dart';
import 'package:let_tutor/presentation/welcome/welcome_screen.dart';
import 'package:let_tutor/core/utils/helpers.dart';

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
        name: TutorScreen.routeName,
        path: '/tutor-list',
        builder: (context, state) => const BottomBar(
          tab: 1,
        ),
      ),
      GoRoute(
        name: TutorDetails.routeName,
        path: '/tutor/:id',
        pageBuilder: (context, state) {
          final String? indexFromTutorBlocString =
              state.uri.queryParameters['indexFromTutorBloc'];
          int? indexFromTutorBloc;
          if (indexFromTutorBlocString != null) {
            indexFromTutorBloc = int.parse(indexFromTutorBlocString);
          }
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: TutorDetails(
              tutorId: state.pathParameters['id']!,
              indexFromTutorBloc: indexFromTutorBloc,
            ),
          );
        },
      ),
      GoRoute(
          name: AllTutorsScreen.routeName,
          path: '/',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AllTutorsScreen(),
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
        path: '/course/:id',
        pageBuilder: (context, state) {
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: CourseDetails(courseId: state.pathParameters['id']!),
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
        path: '/lesson/:index',
        pageBuilder: (context, state) {
          final CourseDetailsEntity courseDetails =
              state.extra as CourseDetailsEntity;
          return Helpers.buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: LessonScreen(
              courseDetails: courseDetails,
              initialIndex: int.parse(state.pathParameters['index'] ?? '0'),
            ),
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
          path: '/book-lesson/:tutorId',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: BookLessonScreen(
                  tutorId: state.pathParameters['tutorId'] ?? ""),
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
          name: RegisterScreen.routeName,
          path: '/register',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const RegisterScreen(),
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
      GoRoute(
          name: SearchScreen.routeName,
          path: '/search',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const SearchScreen(),
            );
          }),
      GoRoute(
          name: TransactionsScreen.routeName,
          path: '/transactions',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const TransactionsScreen(),
            );
          }),
      GoRoute(
          name: ForgotPasswordScreen.routeName,
          path: '/forgot-password',
          pageBuilder: (context, state) {
            return Helpers.buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ForgotPasswordScreen(),
            );
          }),
    ],
    // TODO: Add Error Handler
    // TODO Add Redirect
  );
}
