import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseReasonReport extends StatelessWidget {
  final List<String> reasons;
  final Function setState;
  const ChooseReasonReport({
    super.key,
    required this.reasons,
    required this.setState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.thisTutorIsAnnoyingMe),
          value: reasons
              .contains(AppLocalizations.of(context)!.thisTutorIsAnnoyingMe),
          onChanged: (newValue) {
            if (newValue == true) {
              setState([
                ...reasons,
                AppLocalizations.of(context)!.thisTutorIsAnnoyingMe
              ]);
            } else {
              var newReasons = reasons;
              newReasons
                  .remove(AppLocalizations.of(context)!.thisTutorIsAnnoyingMe);
              setState(newReasons);
            }
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          title: Text(AppLocalizations.of(context)!
              .thisProfileIsPretendingBeSomeoneOrIsFake),
          value: reasons.contains(AppLocalizations.of(context)!
              .thisProfileIsPretendingBeSomeoneOrIsFake),
          onChanged: (newValue) {
            if (newValue == true) {
              setState([
                ...reasons,
                AppLocalizations.of(context)!
                    .thisProfileIsPretendingBeSomeoneOrIsFake
              ]);
            } else {
              var newReasons = reasons;
              newReasons.remove(AppLocalizations.of(context)!
                  .thisProfileIsPretendingBeSomeoneOrIsFake);
              setState(newReasons);
            }
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.inappropriateProfilePhoto),
          value: reasons.contains(
              AppLocalizations.of(context)!.inappropriateProfilePhoto),
          onChanged: (newValue) {
            if (newValue == true) {
              setState([
                ...reasons,
                AppLocalizations.of(context)!.inappropriateProfilePhoto
              ]);
            } else {
              var newReasons = reasons;
              newReasons.remove(
                  AppLocalizations.of(context)!.inappropriateProfilePhoto);
              setState(newReasons);
            }
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}
