import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/core/utils/validators.dart';
import 'package:let_tutor/domain/usecases/auth/change_password.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = 'change-password';
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordUsecase _changePasswordUsecase =
      sl<ChangePasswordUsecase>();
  final String token = sl<SharedPreferences>().getString('access-token') ?? "";

  final TextEditingController _password = TextEditingController(),
      _newPassword = TextEditingController(),
      _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isInProgress = false;

  @override
  void initState() {
    _newPassword.addListener(() {
      setState(() {
        _formKey.currentState!.validate();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child:
            AppBarNormal(title: AppLocalizations.of(context)!.changePassword),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _password,
                    labelText: AppLocalizations.of(context)!.password,
                    keyboardType: TextInputType.visiblePassword,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    validator: FormValidator.validatePassword,
                  ),
                  CustomTextField(
                    controller: _newPassword,
                    labelText: AppLocalizations.of(context)!.newPassword,
                    keyboardType: TextInputType.visiblePassword,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    validator: FormValidator.validatePassword,
                  ),
                  CustomTextField(
                    controller: _confirmPassword,
                    labelText: AppLocalizations.of(context)!.confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    compareTextController: _newPassword,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: AppLocalizations.of(context)!.changePassword,
                    padding: const EdgeInsets.all(20),
                    isInProgress: isInProgress,
                    borderRadius: 10,
                    callback: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      setState(() {
                        isInProgress = true;
                      });
                      _changePasswordUsecase(
                              params: ChangePassowrdUsecaseParams(
                                  token: token,
                                  newPassword: _newPassword.text,
                                  password: _password.text))
                          .then((value) {
                        if (value is DataSuccess) {
                          Helpers.showSnackBar(context, value.data!);
                          Provider.of<AuthProvider>(context, listen: false)
                              .logOut();
                          GoRouter.of(context).goNamed(LoginScreen.routeName);
                        } else {
                          Helpers.showSnackBar(
                              context, value.error?.response?.data['message']);
                        }
                        setState(() {
                          isInProgress = false;
                        });
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
