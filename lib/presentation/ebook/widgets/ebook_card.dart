import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/url_launcher.dart';
import 'package:let_tutor/domain/entities/ebook/ebook_entity.dart';

class EbookCard extends StatelessWidget {
  final bool isExpanded;
  final EbookEntity ebook;
  const EbookCard({super.key, this.isExpanded = false, required this.ebook});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UrlLauncher.launchInBrowserView(Uri.parse(ebook.fileUrl!));
      },
      child: badges.Badge(
        badgeContent: Text(
          AppConstants.courseLevels[int.parse(ebook.level ?? '1')]!,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        position: badges.BadgePosition.topEnd(top: 0, end: 0),
        showBadge: true,
        ignorePointer: false,
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.square,
          badgeColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(5),
          elevation: 0,
        ),
        child: Container(
          decoration: BoxDecoration(
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
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).splashColor,
          ),
          width: isExpanded ? null : 250,
          height: isExpanded ? null : 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: ebook.imageUrl ??
                      "https://images.unsplash.com/photo-1544377193-33dcf4d68fb5?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb",
                  width: isExpanded ? null : 250,
                  height: isExpanded ? null : 200,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  placeholder: (context, url) => Container(
                    width: isExpanded ? null : 250,
                    height: isExpanded ? null : 200,
                    alignment: Alignment.center,
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                    width: isExpanded ? null : 250,
                    height: isExpanded ? null : 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  ebook.name ?? "Ebook",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  ebook.description ?? "",
                  style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
