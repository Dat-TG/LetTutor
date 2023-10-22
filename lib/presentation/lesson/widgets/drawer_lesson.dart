import 'package:flutter/material.dart';

class DrawerLesson extends StatelessWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  final List<String> topics;
  const DrawerLesson(
      {super.key,
      required this.selectedIndex,
      required this.setSelectedIndex,
      required this.topics});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 300,
            child: DrawerHeader(
              decoration: BoxDecoration(
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
            ),
          ),
          for (int i = 0; i < topics.length; i++)
            ListTile(
              title: Text('${i + 1}. ${topics[i]}'),
              selected: selectedIndex == i,
              selectedTileColor: Theme.of(context).primaryColor,
              selectedColor: Colors.white,
              onTap: () {
                // Update the state of the app
                setSelectedIndex(i);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
