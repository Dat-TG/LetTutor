import 'package:flutter/material.dart';

class ListTileItem {
  final String title;
  final Widget leading;
  final Widget? trailing;
  final VoidCallback callback;
  ListTileItem(
      {required this.title,
      required this.leading,
      this.trailing,
      required this.callback});
}
