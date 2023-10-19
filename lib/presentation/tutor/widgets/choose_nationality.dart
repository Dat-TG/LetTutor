import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseNationality extends StatelessWidget {
  final bool isVN;
  final bool isEN;
  final Function setStateVN;
  final Function setStateEN;
  const ChooseNationality(
      {super.key,
      required this.isVN,
      required this.isEN,
      required this.setStateEN,
      required this.setStateVN});

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
                    color: Colors.black,
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
                    color: Colors.black,
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
