import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/video/open_playback_speed_setting.dart';

void openVideoSettings(BuildContext context, double speed,
    List<double> speedVideoLists, Function callback) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromRGBO(37, 37, 38, 1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                tileColor: const Color.fromRGBO(37, 37, 38, 1),
                minLeadingWidth: 10,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(62, 62, 66, 1),
                  ),
                  child: const Icon(
                    Icons.closed_caption_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.captions,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.noCap,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                tileColor: const Color.fromRGBO(37, 37, 38, 1),
                minLeadingWidth: 10,
                leading: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(62, 62, 66, 1),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 1,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Icon(Icons.play_arrow,
                        size: 15, color: Color.fromRGBO(37, 37, 38, 1)),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.quality,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.auto,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                tileColor: const Color.fromRGBO(37, 37, 38, 1),
                minLeadingWidth: 10,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(62, 62, 66, 1),
                  ),
                  child: const Icon(
                    Icons.phone_android_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dataSaver,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.off,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                openPlaybackSpeedSetting(
                    context, speed, speedVideoLists, callback);
              },
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                tileColor: const Color.fromRGBO(37, 37, 38, 1),
                minLeadingWidth: 10,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(62, 62, 66, 1),
                  ),
                  child: const Icon(
                    Icons.directions_run_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.speed,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      speed == 1
                          ? AppLocalizations.of(context)!.normal
                          : '$speed',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
