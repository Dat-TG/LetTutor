import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class ChangeLanguageDialog extends StatefulWidget {
  const ChangeLanguageDialog({super.key});

  @override
  State<ChangeLanguageDialog> createState() => _ChangeLanguageDialogState();
}

class _ChangeLanguageDialogState extends State<ChangeLanguageDialog> {
  @override
  Widget build(BuildContext context) {
    String language = Provider.of<LocaleProvider>(context, listen: false)
                .locale
                ?.languageCode ==
            'en'
        ? AppLocalizations.of(context)!.englishLanguage
        : AppLocalizations.of(context)!.vietnamese;

    void setEnglish(String? value) {
      setState(() {
        language = value!;
        Provider.of<LocaleProvider>(context, listen: false)
            .changeLocaleSettings(const Locale('en'));
      });
    }

    void setVietnamese(String? value) {
      setState(() {
        language = value!;
        Provider.of<LocaleProvider>(context, listen: false)
            .changeLocaleSettings(const Locale('vi'));
      });
    }

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
                setEnglish(AppLocalizations.of(context)!.englishLanguage);
              },
              leading: Radio<String>(
                value: AppLocalizations.of(context)!.englishLanguage,
                groupValue: language,
                onChanged: (String? value) {
                  setEnglish(value);
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
                setVietnamese(AppLocalizations.of(context)!.vietnamese);
              },
              leading: Radio<String>(
                value: AppLocalizations.of(context)!.vietnamese,
                groupValue: language,
                onChanged: (String? value) {
                  setVietnamese(value);
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
