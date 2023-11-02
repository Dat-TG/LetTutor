import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';

class CourseCard extends StatelessWidget {
  final bool isExpanded;
  const CourseCard({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(CourseDetails.routeName),
      child: badges.Badge(
        badgeContent: const Text(
          'Intermediate',
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
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).splashColor,
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
                  'assets/images/course.png',
                  width: isExpanded ? null : 250,
                  height: isExpanded ? null : 185,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Life in the Internet Age',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '7',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!.lessons,
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  'Let\'s discuss how technology is changing the way we live',
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
