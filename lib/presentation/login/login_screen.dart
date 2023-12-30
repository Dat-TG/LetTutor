import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_login.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/login/widgets/login_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/login/widgets/social_login.dart';
import 'package:let_tutor/presentation/register/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return Future.delayed(Duration.zero);
        }
        return Helpers.showExitPopup(context);
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessful) {
            Future.delayed(Duration.zero, () {
              Provider.of<AuthProvider>(context, listen: false)
                  .setAuthEntity(state.authEntity!);
              GoRouter.of(context).goNamed('home');
              context.read<AuthBloc>().add(const ResetStateEvent());
            });
          }
          if (state is AuthFail) {
            Future.delayed(Duration.zero, () {
              Helpers.showSnackBar(
                  context, state.dioException!.response!.data['message']);
            });
          }
        },
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBarLogin(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 50,
              ),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.logInUpperCase,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginForm(
                    authState: state,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.orContinueWith,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SocialLogin(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.notAMemberYet,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signUp,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
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
