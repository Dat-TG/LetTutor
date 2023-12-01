import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/appbar_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = 'welcome';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Helpers.showExitPopup(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          if (state is AuthLoadToken) {
            Future.delayed(Duration.zero, () {
              Helpers.showLoaderDialog(context);
            });
          }
          if (state is AuthSuccessful) {
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
              Provider.of<AuthProvider>(context, listen: false)
                  .setAuthEntity(state.authEntity!);
              GoRouter.of(context).goNamed('home');
              context.read<AuthBloc>().add(const ResetStateEvent());
            });
          }
          if (state is AuthFail) {
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
              context.read<AuthBloc>().add(const ResetStateEvent());
            });
          }

          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBarLogin(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Background image
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/bg-login.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Introduction sentences
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.introduction,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.introductionDescription,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.letStart,
                          callback: () {
                            GoRouter.of(context).goNamed(LoginScreen.routeName);
                          },
                          textSize: 20,
                          borderRadius: 10,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
