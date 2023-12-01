import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/core/utils/validators.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgot-password';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarLogin(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 50,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.resetPassword,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppLocalizations.of(context)!
                  .pleaseEnterYourEmailAddressToSearchForYourAccount,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'email@example.com',
                borderRadius: 10,
                prefixIcon: const Icon(
                  Icons.email,
                  size: 22,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: FormValidator.validateEmail,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<AuthBloc, AuthState>(
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
              builder: (context, state) {
                return CustomButton(
                  title: AppLocalizations.of(context)!.sendResetLink,
                  isInProgress: state is AuthInProress,
                  callback: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    context.read<AuthBloc>().add(
                          ForgotPasswordEvent(
                            email: _emailController.text,
                            context: context,
                          ),
                        );
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  borderRadius: 10,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
