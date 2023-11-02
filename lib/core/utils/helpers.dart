import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Helpers {
  static void openFilterDialog(BuildContext context, List<String> list,
      List<String> selectedList, Function callback) async {
    await FilterListDialog.display<String>(
      context,
      choiceChipLabel: (p0) => p0,
      listData: list,
      selectedListData: selectedList,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (data, query) {
        return data.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        callback(list);
        Navigator.pop(context);
      },
    );
  }

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Future<File?> pickImage() async {
    File? images;
    try {
      var files = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (files != null && files.files.isNotEmpty) {
        images = File(files.files[0].path!);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return images;
  }

  static Future<File?> pickVideo() async {
    File? video;
    try {
      var files = await FilePicker.platform
          .pickFiles(type: FileType.video, allowMultiple: false);
      if (files != null && files.files.isNotEmpty) {
        video = File(files.files[0].path!);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return video;
  }

  static void showSnackBar(BuildContext context, String text,
      [Duration duration = const Duration(seconds: 3)]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: duration),
    );
  }

  static Future<bool> showExitPopup(context) async {
    return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.doYouWantToExit),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                exit(0);
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.red.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              child: Text(AppLocalizations.of(context)!.yes),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Theme.of(context).splashColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.no,
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }) ??
        false;
  }

  static String getUntilLessonTime(DateTime time, BuildContext context) {
    final now = DateTime.now();
    final difference = time.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours - days * 24;
    final minutes = difference.inMinutes - days * 24 * 60 - hours * 60;
    final seconds = difference.inSeconds -
        days * 24 * 60 * 60 -
        hours * 60 * 60 -
        minutes * 60;
    return "${days > 0 ? days : ''} ${days > 1 ? AppLocalizations.of(context)!.days : days == 1 ? AppLocalizations.of(context)!.day : ''} ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
