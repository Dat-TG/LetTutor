import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_date_picker.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/utils/validators.dart';
import 'package:let_tutor/presentation/become-tutor/bloc/become_tutor_bloc.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_attention.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_title.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';

class CompleteProfileForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const CompleteProfileForm({super.key, required this.formKey});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BecomeTutorBloc, BecomeTutorState>(
      builder: (context, state) {
        return Form(
          key: widget.formKey,
          child: Column(
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
                      AppLocalizations.of(context)!
                          .introduceYourselfDescription,
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
                  onTap: () async {
                    var res = await Helpers.pickImage();
                    // ignore: use_build_context_synchronously
                    context.read<BecomeTutorBloc>().add(UpdateState(
                          specialitiesErrorText: state.specialitiesErrorText,
                          uploadImage: res,
                          uploadVideo: state.uploadVideo,
                        ));
                  },
                  child: state.uploadImage == null
                      ? DottedBorder(
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
                                  AppLocalizations.of(context)!
                                      .uploadAvatarHere,
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
                        )
                      : Image.file(
                          state.uploadImage!,
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
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
                          context.read<BecomeTutorBloc>().add(UpdateState(
                                specialitiesErrorText:
                                    state.specialitiesErrorText,
                                uploadImage: state.uploadImage,
                                country: '${value.flagEmoji} ${value.name}',
                                uploadVideo: state.uploadVideo,
                              ));
                        },
                      );
                    },
                    child: Text(
                      state.country,
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
                textEditingController: state.birthDateController,
                minDate: DateTime(1900),
                showIcon: true,
                labelSize: 16,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                validator: FormValidator.validateName,
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
                controller: state.scheduleController,
                labelText: AppLocalizations.of(context)!.interests,
                maxLines: 4,
                hintText: AppLocalizations.of(context)!.interestsPlaceholder,
                margin: EdgeInsets.zero,
                alignLabelWithHint: true,
                validator: FormValidator.validateName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: state.educationController,
                labelText: AppLocalizations.of(context)!.education,
                maxLines: 4,
                hintText: AppLocalizations.of(context)!.educationPlaceholder,
                margin: EdgeInsets.zero,
                alignLabelWithHint: true,
                validator: FormValidator.validateName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: state.experienceController,
                labelText: AppLocalizations.of(context)!.experience,
                maxLines: 4,
                margin: EdgeInsets.zero,
                alignLabelWithHint: true,
                validator: FormValidator.validateName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: state.professionController,
                labelText:
                    AppLocalizations.of(context)!.currentOrPreviousProfession,
                maxLines: 3,
                alignLabelWithHint: true,
                margin: EdgeInsets.zero,
                validator: FormValidator.validateName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              BecomeTutorTitle(
                  text: AppLocalizations.of(context)!.languagesISpeak),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: state.languageController,
                labelText: AppLocalizations.of(context)!.languages,
                maxLines: 3,
                alignLabelWithHint: true,
                margin: EdgeInsets.zero,
                validator: FormValidator.validateName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              BecomeTutorTitle(text: AppLocalizations.of(context)!.whoITeach),
              const SizedBox(
                height: 20,
              ),
              BecomeTutorAttetion(
                  text: AppLocalizations.of(context)!.whoITeachGuide),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: state.introductionController,
                labelText: AppLocalizations.of(context)!.introductionTutor,
                maxLines: 5,
                alignLabelWithHint: true,
                margin: EdgeInsets.zero,
                hintText: AppLocalizations.of(context)!.introductionPlaceholder,
                validator: FormValidator.validateName,
                textInputAction: TextInputAction.next,
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
                    context.read<BecomeTutorBloc>().add(UpdateState(
                          specialitiesErrorText: state.specialitiesErrorText,
                          uploadImage: state.uploadImage,
                          level: AppConstants.basicLevels[i],
                          uploadVideo: state.uploadVideo,
                        ));
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
                    groupValue: state.level,
                    onChanged: (String? value) {
                      context.read<BecomeTutorBloc>().add(UpdateState(
                            specialitiesErrorText: state.specialitiesErrorText,
                            uploadImage: state.uploadImage,
                            level: value,
                            uploadVideo: state.uploadVideo,
                          ));
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
                  backgroundColor: Theme.of(context).splashColor,
                  titleColor: state.specialitiesErrorText != null
                      ? const Color.fromARGB(255, 212, 50, 39)
                      : Theme.of(context).primaryColor,
                  borderColor: state.specialitiesErrorText != null
                      ? const Color.fromARGB(255, 212, 50, 39)
                      : Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  callback: () {
                    Helpers.openFilterDialog(context, AppConstants.specialties,
                        state.selectedSpecialties,
                        (List<MapEntry<dynamic, dynamic>> list) {
                      context.read<BecomeTutorBloc>().add(UpdateState(
                            specialitiesErrorText: list.isNotEmpty
                                ? null
                                : AppLocalizations.of(context)!
                                    .pleaseChooseYourSpecialities,
                            uploadImage: state.uploadImage,
                            uploadVideo: state.uploadVideo,
                            selectedSpecialties: list
                                .map((e) => MapEntry(
                                    e.key as String, e.value as String))
                                .toList(),
                          ));
                    });
                  }),
              if (state.specialitiesErrorText != null)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.specialitiesErrorText!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 212, 50, 39),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: (state.selectedSpecialties.length <
                        AppConstants.specialties.length)
                    ? state.selectedSpecialties
                        .map((e) => TagCard(name: e.value))
                        .toList()
                    : [TagCard(name: AppLocalizations.of(context)!.all)],
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: false,
                maintainState: true,
                child: TextFormField(
                  validator: (value) {
                    if (state.selectedSpecialties.isEmpty) {
                      context.read<BecomeTutorBloc>().add(UpdateState(
                            specialitiesErrorText: AppLocalizations.of(context)!
                                .pleaseChooseYourSpecialities,
                            uploadImage: state.uploadImage,
                            uploadVideo: state.uploadVideo,
                          ));
                    }
                    return (state.birthDateController.text.isNotEmpty &&
                            state.scheduleController.text.isNotEmpty &&
                            state.educationController.text.isNotEmpty &&
                            state.professionController.text.isNotEmpty &&
                            state.experienceController.text.isNotEmpty &&
                            state.languageController.text.isNotEmpty &&
                            state.introductionController.text.isNotEmpty &&
                            state.selectedSpecialties.isNotEmpty)
                        ? null
                        : 'Not valid';
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
