import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_main.dart';
import 'package:let_tutor/presentation/course/course_screen.dart';
import 'package:let_tutor/presentation/home/home_screen.dart';
import 'package:let_tutor/presentation/schedule/schedule_screen.dart';
import 'package:let_tutor/presentation/tutor/tutor_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomBar extends StatefulWidget {
  final int tab;
  const BottomBar({super.key, this.tab = 0});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const TutorScreen(),
    const CourseScreen(),
    const ScheduleScreen(),
    const Text('Profile'),
  ];

  void goToPage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    _page = widget.tab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarMain(),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_rounded,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/images/tutor.png'),
            ),
            label: AppLocalizations.of(context)!.tutors,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.school_rounded,
            ),
            label: AppLocalizations.of(context)!.courses,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.schedule_rounded,
            ),
            label: AppLocalizations.of(context)!.schedule,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person_rounded,
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: goToPage,
        iconSize: 25,
        selectedFontSize: 15,
      ),
    );
  }
}
