import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';

class DrawerLesson extends StatefulWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  final List<String> topics;
  const DrawerLesson(
      {super.key,
      required this.selectedIndex,
      required this.setSelectedIndex,
      required this.topics});

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
              decoration: const BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: AssetImage("assets/images/course.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Life in the Internet Age',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Let\'s discuss how technology is changing the way we live.',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
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
          for (int i = 0; i < widget.topics.length; i++)
            ListTile(
              title: Text('${i + 1}. ${widget.topics[i]}'),
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
