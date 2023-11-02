import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/choose_reasons_report.dart';

class ReportTutor extends StatefulWidget {
  const ReportTutor({super.key});

  @override
  State<ReportTutor> createState() => _ReportTutorState();
}

class _ReportTutorState extends State<ReportTutor> {
  final TextEditingController _noteController = TextEditingController();
  List<String> reasons = [];
  void setReasons(List<String> value) {
    setState(() {
      reasons = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      actionsPadding: const EdgeInsets.only(
        bottom: 20,
        right: 30,
      ),
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${AppLocalizations.of(context)!.report} Keegan'),
            IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_rounded,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!
                        .helpUsUnderstandWhatsHappening,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ChooseReasonReport(reasons: reasons, setState: setReasons),
            CustomTextField(
              controller: _noteController,
              maxLines: 4,
              hintText: AppLocalizations.of(context)!
                  .pleaseLetUsKnowDetailsAboutYourProblem,
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        CustomButton(
          title: AppLocalizations.of(context)!.cancel,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          borderRadius: 5,
          backgroundColor: Colors.grey[200]!,
          titleColor: Colors.black,
          callback: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
          title: AppLocalizations.of(context)!.submitReport,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          borderRadius: 5,
          callback: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
