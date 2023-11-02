import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgot-password';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
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
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'email@example.com',
              borderRadius: 10,
              prefixIcon: const Icon(
                Icons.email,
                size: 22,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              title: AppLocalizations.of(context)!.sendResetLink,
              callback: () {},
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
