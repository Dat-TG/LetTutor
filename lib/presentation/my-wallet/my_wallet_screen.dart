import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/balance.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/my_bonus.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/total_lessons.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/transactions.dart';

class MyWalletScreen extends StatelessWidget {
  static const String routeName = 'my-wallet';
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(
          title: AppLocalizations.of(context)!.myWallet,
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Balance(),
            SizedBox(
              height: 20,
            ),
            TotalLessons(),
            SizedBox(
              height: 20,
            ),
            MyBonus(),
            SizedBox(
              height: 20,
            ),
            Transactions(),
          ],
        ),
      ),
    );
  }
}
