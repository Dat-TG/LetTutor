import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EMAIL',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {},
            style: const TextStyle(fontSize: 18),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
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
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.passwordUppercase,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            style: const TextStyle(
              fontSize: 18,
            ),
            onChanged: (value) {},
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              errorText: null,
              prefixIcon: Icon(
                Icons.lock,
                size: 20,
              ),
              suffixIcon: Icon(
                Icons.visibility_off,
                size: 20,
              ),
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
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.forgotPassword,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(40, 106, 210, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: AppLocalizations.of(context)!.logInUpperCase,
                  callback: () {},
                  textSize: 22,
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
    );
  }
}
