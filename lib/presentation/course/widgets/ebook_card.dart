import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class EbookCard extends StatelessWidget {
  final bool isExpanded;
  const EbookCard({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: const Text(
        'Beginner',
        style: TextStyle(
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
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: isExpanded ? null : 250,
        height: isExpanded ? null : 311,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                'assets/images/ebook.jpeg',
                width: isExpanded ? null : 250,
                height: isExpanded ? null : 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'What a world 1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                'For teenagers who have an excellent vocabulary background and brilliant communication skills.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
