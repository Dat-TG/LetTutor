import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/presentation/messenger/messenger_screen.dart';
import 'package:let_tutor/presentation/search/search_screen.dart';
import 'package:provider/provider.dart';

class AppBarMain extends StatefulWidget {
  const AppBarMain({super.key});

  @override
  State<AppBarMain> createState() => _AppBarMainState();
}

class _AppBarMainState extends State<AppBarMain> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeProvider>(context).isDarkModeOn ??
        (ThemeMode.system == ThemeMode.dark);
    return AppBar(
      centerTitle: true,
      toolbarHeight: 60,
      iconTheme: const IconThemeData(),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/lettutor_logo.png',
            height: 30,
          ),
          // Search and Message
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? Colors.grey[600] : Colors.black12,
                ),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(SearchScreen.routeName);
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? Colors.grey[600] : Colors.black12,
                ),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(MessengerScreen.routeName);
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.sms_rounded,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
