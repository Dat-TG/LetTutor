import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/presentation/become-tutor/become_tutor_screen.dart';
import 'package:let_tutor/presentation/edit-account/edit_account_screen.dart';
import 'package:let_tutor/presentation/history/history_screen.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:let_tutor/presentation/my-wallet/my_wallet_screen.dart';
import 'package:let_tutor/presentation/settings/settings_screen.dart';
import 'package:let_tutor/core/utils/listtile_item.dart';
import 'package:let_tutor/core/utils/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = Provider.of<AuthProvider>(context).authEntity.user!;
    String fbPageId = 'lettutorvn';
    String facebookBaseUrl = 'https://www.facebook.com';
    String fbProtocolUrl =
        'fb://facewebmodal/f?href=$facebookBaseUrl/$fbPageId';
    final List<ListTileItem> options = [
      ListTileItem(
          title: AppLocalizations.of(context)!.editAccount,
          leading: Icon(
            Icons.edit_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            GoRouter.of(context).pushNamed(EditAccountScreen.routeName);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.myWallet,
          leading: Icon(
            Icons.wallet_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            GoRouter.of(context).pushNamed(MyWalletScreen.routeName);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.settings,
          leading: Icon(
            Icons.settings_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            GoRouter.of(context).pushNamed(SettingsScreen.routeName);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.history,
          leading: Icon(
            Icons.history_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            GoRouter.of(context).pushNamed(HistoryScreen.routeName);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.becomeATutor,
          leading: ImageIcon(
            const AssetImage('assets/images/tutor.png'),
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            GoRouter.of(context).pushNamed(BecomeTutorScreen.routeName);
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.shareApp,
          leading: Icon(
            Icons.share_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.facebookPage,
          leading: Icon(
            Icons.facebook_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () async {
            try {
              UrlLauncher.launchInExternalApp(Uri.parse(fbProtocolUrl),
                  Uri.parse('$facebookBaseUrl/$fbPageId'));
            } catch (error) {
              throw Exception('Cannot launch url $fbProtocolUrl');
            }
          }),
      ListTileItem(
          title: AppLocalizations.of(context)!.rateApp,
          leading: Icon(
            Icons.star_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {}),
      ListTileItem(
          title: AppLocalizations.of(context)!.logOut,
          leading: Icon(
            Icons.logout_rounded,
            color: Theme.of(context).primaryColor,
          ),
          callback: () {
            Provider.of<AuthProvider>(context, listen: false).logOut();
            GoRouter.of(context).goNamed(LoginScreen.routeName);
          }),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
            child: DrawerHeader(
              padding: const EdgeInsets.only(left: 16),
              margin: const EdgeInsets.only(
                bottom: 8,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/drawerbg.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: user.avatar ?? Helpers.avatarFromName(user.name),
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 40,
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) => const CircleAvatar(
                      radius: 40,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => CachedNetworkImage(
                      imageUrl: Helpers.avatarFromName(user.name),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 40,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => const CircleAvatar(
                        radius: 32,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    user.name ?? 'Username',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email ?? 'email@example.com',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.phone ?? '841234567890',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (int i = 0; i < options.length; i++)
            ListTile(
              title: Text(
                options[i].title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: options[i].leading,
              trailing: options[i].trailing,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                options[i].callback();
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
