import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/domain/entities/wallet/transaction_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionItem extends StatelessWidget {
  final TransactionEntity transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    bool isBook = transaction.type == 'buy';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                color: isBook ? Colors.red[50] : Colors.green[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: isBook
                  ? const Icon(
                      Icons.arrow_downward_rounded,
                      size: 20,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.arrow_upward_rounded,
                      size: 20,
                      color: Colors.green,
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 187,
                  child: Text(
                    isBook
                        ? '${AppLocalizations.of(context)!.booked} ${transaction.tutor}'
                        : '${AppLocalizations.of(context)!.cancelBooking} ${transaction.tutor}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat('y-M-d').format(transaction.time!),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          '${isBook ? '-' : '+'} 1 ${AppLocalizations.of(context)!.lesson}',
          style: TextStyle(
            fontSize: 15,
            color: isBook ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
