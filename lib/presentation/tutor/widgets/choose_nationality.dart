import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseNationality extends StatelessWidget {
  final bool isVN;
  final bool isEN;
  final bool isForeign;
  final Function setStateVN;
  final Function setStateEN;
  final Function setStateForeign;
  const ChooseNationality(
      {super.key,
      required this.isVN,
      required this.isEN,
      required this.isForeign,
      required this.setStateEN,
      required this.setStateVN,
      required this.setStateForeign});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://images.squarespace-cdn.com/content/v1/5fa6b76b045ef433ae7b252e/1604765875569-MUAEJNXG2NL6E4VEORZ6/Flag_20x30.jpg',
                  width: 30,
                  height: 20,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.flag,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.foreignTutor,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            value: isForeign,
            onChanged: (newValue) {
              setStateForeign(newValue);
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        SizedBox(
          height: 40,
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/vietnam.png',
                  width: 30,
                  height: 20,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.vietnameseTutor,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            value: isVN,
            onChanged: (newValue) {
              setStateVN(newValue);
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        SizedBox(
          height: 40,
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/united-states.png',
                  width: 30,
                  height: 20,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.englishTutor,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            value: isEN,
            onChanged: (newValue) {
              setStateEN(newValue);
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }
}
