import 'package:flutter/material.dart';
import 'package:let_tutor/common/custom_button.dart';
import 'package:let_tutor/common/appbar_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.black87,
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
                    callback: () {},
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
        ),
      ),
    );
  }
}
