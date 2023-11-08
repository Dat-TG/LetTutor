import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_date_picker.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/common/dropdown_select.dart';
import 'package:let_tutor/core/utils/validators.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';

class EditAccountScreen extends StatefulWidget {
  static const String routeName = 'edit-account';
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final TextEditingController _emailController =
          TextEditingController(text: 'student@lettutor.com'),
      _nameController = TextEditingController(text: 'Phhai123'),
      _phoneController = TextEditingController(text: '842499996508'),
      _countryController = TextEditingController(text: 'Vietnam'),
      _birthDateController = TextEditingController(text: '2002-10-13'),
      _scheduleController = TextEditingController();

  File? uploadImage;
  void selectImage() async {
    var res = await Helpers.pickImage();
    setState(() {
      uploadImage = res;
    });
  }

  List<String> selectSubjects = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _birthDateController.dispose();
    _scheduleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(
          title: AppLocalizations.of(context)!.editAccount,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () async {
                  selectImage();
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/hero_img.png'),
                  radius: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  children: const [
                    TextSpan(
                      text: 'ID: ',
                    ),
                    TextSpan(text: 'f569c202-7bbf-4620-af77-ecc1419a6b28'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: AppLocalizations.of(context)!.enterYourName,
                      labelText: AppLocalizations.of(context)!.name,
                      validator: FormValidator.validateName,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'email@example.com',
                      labelText: 'Email',
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _countryController,
                      labelText: AppLocalizations.of(context)!.country,
                      readOnly: true,
                      onTap: () {
                        showCountryPicker(
                          context: context, useSafeArea: true,
                          showPhoneCode:
                              false, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            _countryController.text = country.name;
                          },
                        );
                      },
                    ),
                    CustomTextField(
                      controller: _phoneController,
                      hintText: '0794299888',
                      labelText: AppLocalizations.of(context)!.phoneNumber,
                      keyboardType: TextInputType.phone,
                      validator: FormValidator.validatePhone,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomDatePicker(
                        labelText: AppLocalizations.of(context)!.birthday,
                        textEditingController: _birthDateController,
                        minDate: DateTime(1900),
                        showIcon: false,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSelect(
                          options: AppConstants.learnerLevels,
                          labelText: AppLocalizations.of(context)!.myLevel),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                          title: AppLocalizations.of(context)!.wantToLearn,
                          backgroundColor: Theme.of(context).splashColor,
                          titleColor: Theme.of(context).primaryColor,
                          borderColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          callback: () {
                            Helpers.openFilterDialog(
                                context,
                                AppConstants.specialties,
                                selectSubjects, (List<String> list) {
                              setState(() {
                                selectSubjects = list;
                              });
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: (selectSubjects.length <
                                AppConstants.specialties.length)
                            ? selectSubjects
                                .map((e) => TagCard(name: e))
                                .toList()
                            : [
                                TagCard(name: AppLocalizations.of(context)!.all)
                              ],
                      ),
                    ),
                    CustomTextField(
                        controller: _scheduleController,
                        labelText: AppLocalizations.of(context)!.studySchedule,
                        alignLabelWithHint: true,
                        maxLines: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  title: AppLocalizations.of(context)!.saveChanges,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  callback: () {
                    _formKey.currentState!.validate();
                  },
                  icon: const Icon(
                    Icons.save_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
