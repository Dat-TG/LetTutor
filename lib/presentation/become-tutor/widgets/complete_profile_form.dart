import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_date_picker.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_attention.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_title.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  File? uploadImage;
  void selectImage() async {
    var res = await Helpers.pickImage();
    setState(() {
      uploadImage = res;
    });
  }

  String country = '🇻🇳 Vietnam';
  final TextEditingController _birthDateController = TextEditingController(),
      _scheduleController = TextEditingController(),
      _educationController = TextEditingController(),
      _professionController = TextEditingController(),
      _experienceController = TextEditingController(),
      _languageController = TextEditingController(),
      _introductionController = TextEditingController();

  String _level = 'Beginner';

  List<String> selectedSpecialties = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.introduceYourself,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/introduce_yourself.png',
              ),
              radius: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.introduceYourselfDescription,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorTitle(text: AppLocalizations.of(context)!.basicInfo),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: selectImage,
            child: DottedBorder(
              color: Colors.black,
              strokeWidth: 1,
              dashPattern: const [3, 3],
              child: Container(
                width: 250,
                height: 250,
                color: Colors.grey.withOpacity(0.3),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.uploadAvatarHere,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tapToUpload,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              '${AppLocalizations.of(context)!.iAmFrom}:',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                showCountryPicker(
                  context: context, useSafeArea: true,
                  showPhoneCode:
                      false, // optional. Shows phone code before the country name.
                  onSelect: (Country value) {
                    setState(() {
                      country = '${value.flagEmoji} ${value.name}';
                    });
                  },
                );
              },
              child: Text(
                country,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDatePicker(
          labelText: AppLocalizations.of(context)!.birthday,
          textEditingController: _birthDateController,
          minDate: DateTime(1900),
          showIcon: true,
          labelSize: 16,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const BecomeTutorTitle(text: 'CV'),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.cvDescription,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorAttetion(text: AppLocalizations.of(context)!.cvGuide),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: _scheduleController,
          labelText: AppLocalizations.of(context)!.interests,
          maxLines: 4,
          hintText: AppLocalizations.of(context)!.interestsPlaceholder,
          margin: EdgeInsets.zero,
          alignLabelWithHint: true,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: _educationController,
          labelText: AppLocalizations.of(context)!.education,
          maxLines: 4,
          hintText: AppLocalizations.of(context)!.educationPlaceholder,
          margin: EdgeInsets.zero,
          alignLabelWithHint: true,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: _experienceController,
          labelText: AppLocalizations.of(context)!.experience,
          maxLines: 4,
          margin: EdgeInsets.zero,
          alignLabelWithHint: true,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: _professionController,
          labelText: AppLocalizations.of(context)!.currentOrPreviousProfession,
          maxLines: 3,
          alignLabelWithHint: true,
          margin: EdgeInsets.zero,
        ),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorTitle(text: AppLocalizations.of(context)!.languagesISpeak),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: _languageController,
          labelText: AppLocalizations.of(context)!.languages,
          maxLines: 3,
          alignLabelWithHint: true,
          margin: EdgeInsets.zero,
        ),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorTitle(text: AppLocalizations.of(context)!.whoITeach),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorAttetion(text: AppLocalizations.of(context)!.whoITeachGuide),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: _introductionController,
          labelText: AppLocalizations.of(context)!.introductionTutor,
          maxLines: 5,
          alignLabelWithHint: true,
          margin: EdgeInsets.zero,
          hintText: AppLocalizations.of(context)!.introductionPlaceholder,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.iAmBestAt,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        for (int i = 0; i < AppConstants.basicLevels.length; i++)
          ListTile(
            onTap: () {
              setState(() {
                _level = AppConstants.basicLevels[i];
              });
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              AppConstants.basicLevels[i],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            leading: Radio<String>(
              value: AppConstants.basicLevels[i],
              groupValue: _level,
              onChanged: (String? value) {
                setState(() {
                  _level = value!;
                });
              },
            ),
          ),
        Text(
          AppLocalizations.of(context)!.mySpecialitiesAre,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
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
          height: 20,
        ),
      ],
    );
  }
}
