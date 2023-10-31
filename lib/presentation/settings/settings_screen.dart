import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/presentation/settings/change_password_screen.dart';
import 'package:let_tutor/presentation/settings/widgets/about_us_dialog.dart';
import 'package:let_tutor/presentation/settings/widgets/change_language_dialog.dart';
import 'package:let_tutor/presentation/settings/widgets/feedback_dialog.dart';
import 'package:let_tutor/core/utils/listtile_item.dart';
import 'package:let_tutor/core/utils/url_launcher.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> changeLanguage(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const ChangeLanguageDialog();
      },
    );
  }

  Future<void> feedback(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const FeedbackDialog();
      },
    );
  }

  Future<void> openAboutUsDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AboutUsDialog();
      },
    );
  }

  Future<void> openAboutDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AboutDialog(
          applicationIcon: Image.asset(
            'assets/images/ic.png',
            width: 50,
          ),
          applicationLegalese:
              '${AppLocalizations.of(context)!.introductionDescription}\n\nDeveloper: Lê Công Đắt\ndat13102k2@gmail.com\nStudentID: 20120454',
          applicationName: 'LetTutor',
          applicationVersion: '1.0.0',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String locale =
        Provider.of<LocaleProvider>(context).locale?.languageCode ?? 'en';
    bool? isDark = Provider.of<DarkModeProvider>(context).isDarkModeOn;

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
                locale == 'en'
                    ? 'assets/images/united-states.png'
                    : 'assets/images/vietnam.png',
                width: 22.5,
                height: 15,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                locale == 'en'
                    ? AppLocalizations.of(context)!.englishLanguage
                    : AppLocalizations.of(context)!.vietnamese,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          callback: () {
            changeLanguage(context);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.darkMode,
          leading: Icon(
            Icons.dark_mode_rounded,
            color: Theme.of(context).primaryColor,
          ),
          trailing: Switch(
            value: isDark ?? (ThemeMode.system == ThemeMode.dark),
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              Provider.of<DarkModeProvider>(context, listen: false)
                  .changDarkModeSettings(value);
            },
          ),
          callback: () {
            Provider.of<DarkModeProvider>(context, listen: false)
                .changDarkModeSettings(isDark == null
                    ? !(ThemeMode.system == ThemeMode.dark)
                    : !isDark);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.changePassword,
          leading: Icon(
            Icons.key_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            GoRouter.of(context).pushNamed(ChangePasswordScreen.routeName);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.privacyPolicy,
          leading: Icon(
            Icons.privacy_tip_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            UrlLauncher.launchInBrowserView(
                Uri.parse('https://lettutor.com/tos.html'));
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.termsAndConditions,
          leading: Icon(
            Icons.my_library_books,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            UrlLauncher.launchInBrowserView(
                Uri.parse('https://lettutor.com/tos.html'));
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.feedback,
          leading: Icon(
            Icons.feedback_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            feedback(context);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.aboutUs,
          leading: Icon(
            Icons.info_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            openAboutUsDialog(context);
          }),
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
          callback: () {
            openAboutDialog(context);
          }),
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
