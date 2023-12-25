import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<AuthProvider>(context, listen: false).authEntity.user;
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(
              0,
              0,
            ),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.balance,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${int.parse(user?.walletInfo?.amount ?? '0') ~/ 100000}',
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.lessons,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
