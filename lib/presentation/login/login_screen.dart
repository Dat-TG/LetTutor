import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_login.dart';
import 'package:let_tutor/presentation/login/widgets/login_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const LoginForm(),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.orContinueWith,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/facebook.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset(
                  'assets/images/google.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/mobile.png',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.notAMemberYet,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.signUp,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
