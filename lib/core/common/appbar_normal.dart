import 'package:flutter/material.dart';

class AppBarNormal extends StatelessWidget {
  final String title;
  const AppBarNormal({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(),
        centerTitle: true,
        toolbarHeight: 60,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
