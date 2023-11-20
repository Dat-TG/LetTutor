import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';

class DrawerLesson extends StatefulWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  final CourseDetailsEntity courseDetails;
  const DrawerLesson(
      {super.key,
      required this.selectedIndex,
      required this.setSelectedIndex,
      required this.courseDetails});

  @override
  State<DrawerLesson> createState() => _DrawerLessonState();
}

class _DrawerLessonState extends State<DrawerLesson> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    widget.courseDetails.imageUrl ??
                        "https://images.unsplash.com/photo-1544377193-33dcf4d68fb5?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb",
                  ),
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.courseDetails.name ?? "Course Name",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.courseDetails.description ??
                            "Course Description",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      int count = 2;
                      Navigator.popUntil(context, (route) => count-- == 0);
                    },
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.exit_to_app_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    tooltip: AppLocalizations.of(context)!.exit,
                  ),
                ],
              ),
            ),
          ),
          for (int i = 0; i < (widget.courseDetails.topics?.length ?? 0); i++)
            ListTile(
              title: Text('${i + 1}. ${widget.courseDetails.topics?[i].name}'),
              selected: widget.selectedIndex == i,
              selectedTileColor: Theme.of(context).primaryColor,
              selectedColor: Colors.white,
              onTap: () {
                // Update the state of the app
                widget.setSelectedIndex(i);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
