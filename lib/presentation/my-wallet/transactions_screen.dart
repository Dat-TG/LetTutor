import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/cell_content.dart';
import 'package:let_tutor/presentation/my-wallet/widgets/column_label.dart';

class TransactionsScreen extends StatelessWidget {
  static const String routeName = 'transactions';
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            for (int i = 0; i < 10; i++)
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CellContent(
                      content: Text(
                        DateFormat('y-M-d hh:mm', 'en').format(
                          DateTime.now(),
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
                        AppLocalizations.of(context)!.book,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: CellContent(
                      content: Text(
                        'Keegan',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: CellContent(
                      content: Text(
                        'Phhai123',
                        style: TextStyle(
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
