import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void openPlaybackSpeedSetting(BuildContext context, double speed,
    List<double> speedVideoLists, Function callback) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: const Color.fromRGBO(37, 37, 38, 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateLocal) =>
              Column(mainAxisSize: MainAxisSize.min, children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  splashColor: Colors.white.withOpacity(0.5),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.speed,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            for (int i = 0; i < speedVideoLists.length; i++)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    tileColor: const Color.fromRGBO(37, 37, 38, 1),
                    minLeadingWidth: 10,
                    leading: speed == speedVideoLists[i]
                        ? const Icon(
                            Icons.check,
                            size: 25,
                            color: Colors.white,
                          )
                        : const SizedBox(width: 25),
                    title: Text(
                      '${speedVideoLists[i]}${speedVideoLists[i] == 1 ? ' (${AppLocalizations.of(context)!.normal})' : ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      setStateLocal(() {
                        speed = speedVideoLists[i];
                      });
                      callback(i);
                    },
                  ),
                ),
              ),
          ]),
        );
      });
}
