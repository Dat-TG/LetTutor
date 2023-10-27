import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_date_picker.dart';
import 'package:let_tutor/core/common/custom_time_picker.dart';
import 'package:let_tutor/presentation/tutor/widgets/choose_nationality.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorSearch extends StatefulWidget {
  const TutorSearch({super.key});

  @override
  State<TutorSearch> createState() => _TutorSearchState();
}

class _TutorSearchState extends State<TutorSearch> {
  bool isVN = true, isEN = true;
  final TextEditingController dateController = TextEditingController(),
      startTimeController = TextEditingController(),
      endTimeController = TextEditingController();
  List<String> selectedSpecialties = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterTutorName,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.nationality,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        ChooseNationality(
          isVN: isVN,
          isEN: isEN,
          setStateEN: (bool newValue) {
            setState(() {
              isEN = newValue;
            });
          },
          setStateVN: (bool newValue) {
            setState(() {
              isVN = newValue;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.availableTutoringTime,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDatePicker(
          labelText: AppLocalizations.of(context)!.date,
          textEditingController: dateController,
          minDate: DateTime.now(),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTimePicker(
                textEditingController: startTimeController,
                label: AppLocalizations.of(context)!.startTime,
              ),
            ),
            const Icon(
              Icons.arrow_right_alt_rounded,
              size: 30,
            ),
            Expanded(
              child: CustomTimePicker(
                textEditingController: endTimeController,
                label: AppLocalizations.of(context)!.endTime,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.specialities,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
            title: AppLocalizations.of(context)!.chooseSpecialities,
            backgroundColor: Colors.white,
            titleColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            callback: () {
              Helpers.openFilterDialog(
                  context, AppConstants.specialties, selectedSpecialties,
                  (List<String> list) {
                setState(() {
                  selectedSpecialties = list;
                });
              });
            }),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              (selectedSpecialties.length < AppConstants.specialties.length)
                  ? selectedSpecialties.map((e) => TutorTag(name: e)).toList()
                  : [TutorTag(name: AppLocalizations.of(context)!.all)],
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            title: AppLocalizations.of(context)!.search,
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 20,
            ),
            callback: () {},
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
          ),
        )
      ],
    );
  }
}
