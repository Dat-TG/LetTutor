import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/utils/listtile_item.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final List<ListTileItem> options = [
      ListTileItem(
          title: AppLocalizations.of(context)!.language,
          leading: Icon(
            Icons.language_rounded,
            color: Theme.of(context).primaryColor,
          ),
          trailing: Row(
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
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.darkMode,
          leading: Icon(
            Icons.dark_mode_rounded,
            color: Theme.of(context).primaryColor,
          ),
          trailing: Switch(
            value: isDarkMode,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
          callback: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.changePassword,
          leading: Icon(
            Icons.key_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.privacyPolicy,
          leading: Icon(
            Icons.privacy_tip_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.termsAndConditions,
          leading: Icon(
            Icons.my_library_books,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.feedback,
          leading: Icon(
            Icons.feedback_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.aboutUs,
          leading: Icon(
            Icons.info_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.version,
          leading: Icon(
            Icons.collections_bookmark_rounded,
            color: Theme.of(context).primaryColor,
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          callback: () {}),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: options.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                options[index].title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: options[index].leading,
              trailing: options[index].trailing,
              onTap: () {
                options[index].callback();
              },
            );
          },
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}