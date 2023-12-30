import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/domain/entities/wallet/transaction_entity.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/cell_content.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/column_label.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatelessWidget {
  static const String routeName = 'transactions';
  final List<TransactionEntity> transactions;
  const TransactionsScreen({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<AuthProvider>(context, listen: false).authEntity.user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.transactions),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ColumnLabel(
                    title: AppLocalizations.of(context)!.time,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ColumnLabel(
                    title: AppLocalizations.of(context)!.type,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ColumnLabel(
                    title: AppLocalizations.of(context)!.tutor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ColumnLabel(
                    title: AppLocalizations.of(context)!.student,
                  ),
                ),
              ],
            ),
            for (int i = 0; i < transactions.length; i++)
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CellContent(
                      content: Text(
                        DateFormat('y-M-d HH:MM', 'en').format(
                          transactions[i].time!,
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CellContent(
                      content: Text(
                        transactions[i].type == 'buy'
                            ? AppLocalizations.of(context)!.bookTransaction
                            : AppLocalizations.of(context)!.cancelBooking,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CellContent(
                      content: Text(
                        transactions[i].tutor!,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CellContent(
                      content: Text(
                        user!.name!,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
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
