import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:let_tutor/presentation/login/bloc/auth_bloc.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  Future<void> _handleSignIn() async {
    _googleSignIn.signIn().then((result) {
      result?.authentication.then((googleKey) {
        print(googleKey.accessToken);
        context
            .read<AuthBloc>()
            .add(LoginGoogleEvent(accessToken: googleKey.accessToken ?? ""));
      }).catchError((err) {
        print('inner error: $err');
      });
    }).catchError((err) {
      print('error occured: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
        GestureDetector(
          onTap: _handleSignIn,
          child: Image.asset(
            'assets/images/google.png',
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
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
    );
  }
}
