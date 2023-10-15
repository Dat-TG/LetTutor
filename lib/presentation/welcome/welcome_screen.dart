import 'package:flutter/material.dart';
import 'package:let_tutor/common/action_button.dart';
import 'package:let_tutor/common/appbar_login.dart';

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
          horizontal: 20,
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
                'Say hello to your English tutors',
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
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Become fluent faster through one on one video chat lessons tailored to your goals.',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    title: 'Let\'s Start',
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
