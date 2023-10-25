import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguageDialog extends StatefulWidget {
  const ChangeLanguageDialog({super.key});

  @override
  State<ChangeLanguageDialog> createState() => _ChangeLanguageDialogState();
}

class _ChangeLanguageDialogState extends State<ChangeLanguageDialog> {
  String _language = 'English';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.selectLanguage),
            IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/united-states.png',
                    width: 22.5,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.englishLanguage,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onTap: () {
                setState(() {
                  _language = 'English';
                });
                Navigator.pop(context);
              },
              leading: Radio<String>(
                value: 'English',
                groupValue: _language,
                onChanged: (String? value) {
                  setState(() {
                    _language = value!;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/vietnam.png',
                    width: 22.5,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.vietnamese,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onTap: () {
                setState(() {
                  _language = 'Vietnamese';
                });
                Navigator.pop(context);
              },
              leading: Radio<String>(
                value: 'Vietnamese',
                groupValue: _language,
                onChanged: (String? value) {
                  setState(() {
                    _language = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
