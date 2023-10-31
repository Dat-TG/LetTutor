import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:provider/provider.dart';

class MyBonus extends StatelessWidget {
  final int points;
  const MyBonus({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Provider.of<DarkModeProvider>(context, listen: false).isDarkModeOn ??
            (ThemeMode.system == ThemeMode.dark);
    return Container(
      width: double.infinity,
      height: 250,
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
            AppLocalizations.of(context)!.bonus,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '$points ₫',
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            color: isDark ? Colors.blue[600] : Colors.blue[100],
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.referralCode,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'RSJYDZYQLE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                          const ClipboardData(text: 'RSJYDZYQLE'));
                      if (context.mounted) {
                        Helpers.showSnackBar(context,
                            AppLocalizations.of(context)!.copiedToClipboard);
                      }
                    },
                    child: const Icon(
                      Icons.copy_outlined,
                      size: 20,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalizations.of(context)!.bonusInfo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
