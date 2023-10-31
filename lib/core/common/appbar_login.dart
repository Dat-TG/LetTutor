import 'package:flutter/material.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class AppBarLogin extends StatefulWidget {
  const AppBarLogin({super.key});

  @override
  State<AppBarLogin> createState() => _AppBarLoginState();
}

class _AppBarLoginState extends State<AppBarLogin> {
  List<Language> languages = [
    Language(image: 'assets/images/united-states.png', name: 'English'),
    Language(image: 'assets/images/vietnam.png', name: 'Vietnamese'),
  ];

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<LocaleProvider>(context, listen: true)
                .locale
                ?.languageCode ==
            'en'
        ? 0
        : 1;
    return AppBar(
      centerTitle: true,
      toolbarHeight: 80,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/lettutor_logo.png',
            height: 45,
          ),
          // Language change button
          MenuAnchor(
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(languages[index].image),
                    radius: 12,
                  ),
                ),
              );
            },
            menuChildren: List<MenuItemButton>.generate(
              2,
              (int id) => MenuItemButton(
                onPressed: () {
                  if (id != index) {
                    Provider.of<LocaleProvider>(context, listen: false)
                        .changeLocaleSettings(Locale(id == 0 ? 'en' : 'vi'));
                  }
                  setState(() => index = id);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      languages[id].image,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      languages[id].name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Language {
  final String image;
  final String name;
  Language({
    required this.image,
    required this.name,
  });
}
