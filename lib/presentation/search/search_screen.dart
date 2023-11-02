import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/course/widgets/course_search.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_search.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(),
          centerTitle: true,
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context)!.search,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).iconTheme.color,
            tabs: <Widget>[
              Tab(
                icon: const ImageIcon(
                  AssetImage('assets/images/tutor.png'),
                  size: 30,
                ),
                text: AppLocalizations.of(context)!.tutor,
              ),
              Tab(
                icon: const Icon(
                  Icons.school_rounded,
                  size: 30,
                ),
                text:
                    '${AppLocalizations.of(context)!.course} & ${AppLocalizations.of(context)!.ebook}',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 30,
              right: 20,
            ),
            child: TutorSearch(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 30,
              right: 20,
            ),
            child: CourseSearch(),
          ),
        ]),
      ),
    );
  }
}
