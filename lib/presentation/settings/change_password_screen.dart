import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/utils/validators.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = 'change-password';
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _password = TextEditingController(),
      _newPassword = TextEditingController(),
      _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    borderRadius: 10,
                    callback: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
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
