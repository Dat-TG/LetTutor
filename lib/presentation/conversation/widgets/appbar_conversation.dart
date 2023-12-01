import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class AppBarConversation extends StatelessWidget {
  final ReceiverInfoEntity user;
  const AppBarConversation({super.key, required this.user});

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
            child: CachedNetworkImage(
              imageUrl: user.avatar ?? Helpers.avatarFromName(user.name),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 25,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircleAvatar(
                radius: 25,
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => CachedNetworkImage(
                imageUrl: Helpers.avatarFromName(user.name),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 25,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => const CircleAvatar(
                  radius: 25,
                  child: SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
              ),
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
              Text(
                user.name ?? 'Username',
                style: const TextStyle(
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
              GoRouter.of(context)
                  .pushNamed(TutorDetails.routeName, pathParameters: {
                'id': user.id ?? "",
              });
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
