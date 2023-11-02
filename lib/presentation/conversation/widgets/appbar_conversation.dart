import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class AppBarConversation extends StatelessWidget {
  const AppBarConversation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Provider.of<DarkModeProvider>(context, listen: false)
                    .isDarkModeOn ==
                true
            ? Colors.white
            : Colors.black,
      ),
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          badges.Badge(
            position: badges.BadgePosition.bottomEnd(
              bottom: 3,
              end: -5,
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.white,
              borderRadius: BorderRadius.circular(100),
              padding: const EdgeInsets.all(2),
              shape: badges.BadgeShape.circle,
            ),
            badgeContent: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
              radius: 25,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Keegan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.online,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            splashRadius: 20,
            onPressed: () {
              GoRouter.of(context).pushNamed(TutorDetails.routeName);
            },
            icon: Icon(
              Icons.info_rounded,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
