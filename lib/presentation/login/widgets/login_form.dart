import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/utils/validators.dart';
import 'package:let_tutor/presentation/forgot-password/forgot_password_screen.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  final bool isRegister;
  final AuthState authState;
  const LoginForm({
    super.key,
    this.isRegister = false,
    required this.authState,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void onSubmit() {
    if (!_emailKey.currentState!.validate() ||
        !_passwordKey.currentState!.validate()) {
      return;
    }
    if (widget.isRegister) {
      GoRouter.of(context).goNamed(LoginScreen.routeName);
    } else {
      context.read<AuthBloc>().add(
            LoginEvent(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _emailKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'EMAIL',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                onChanged: (value) {
                  _emailKey.currentState!.validate();
                },
                style: const TextStyle(fontSize: 18),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return FormValidator.validateEmail(value, context);
                },
                decoration: const InputDecoration(
                  hintText: 'email@example.com',
                  prefixIcon: Icon(
                    Icons.email,
                    size: 20,
                  ),
                  errorText: null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: _passwordKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.passwordUppercase,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontSize: 18,
                ),
                onChanged: (value) {
                  _passwordKey.currentState!.validate();
                },
                validator: (value) {
                  return FormValidator.validatePassword(value, context);
                },
                onFieldSubmitted: (value) {
                  onSubmit();
                },
                obscureText: isPasswordVisible ? false : true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: null,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: isPasswordVisible
                        ? const Icon(
                            Icons.visibility_off,
                            size: 20,
                          )
                        : const Icon(
                            Icons.visibility,
                            size: 20,
                          ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        if (!widget.isRegister)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(ForgotPasswordScreen.routeName);
              },
              child: Text(
                AppLocalizations.of(context)!.forgotPassword,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(40, 106, 210, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                isInProgress: widget.authState is AuthInProress,
                title: widget.isRegister
                    ? AppLocalizations.of(context)!.registerUppercase
                    : AppLocalizations.of(context)!.logInUpperCase,
                callback: onSubmit,
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
      ],
    );
  }
}
