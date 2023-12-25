import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/presentation/my-wallet/bloc/wallet_bloc.dart';
import 'package:let_tutor/presentation/my-wallet/transactions_screen.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/transaction_item.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  AppLocalizations.of(context)!.transactions,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocBuilder<WalletBloc, WalletState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                            TransactionsScreen.routeName,
                            extra: state.transactions);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.viewMore,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: BlocBuilder<WalletBloc, WalletState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is WalletLoadedTransactions) {
                  return const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                  );
                }
                if (state.errorTransactions != null) {
                  return Center(
                      child: Text(
                          state.errorTransactions!.response!.statusMessage!));
                }
                if (state.transactions == null) {
                  return const Center(
                    child: Text('No transactions'),
                  );
                }
                return Column(
                  children: [
                    for (int i = 0;
                        i < min(5, state.transactions?.length ?? 0);
                        i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TransactionItem(
                            transaction: state.transactions![i]),
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
