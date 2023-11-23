import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_date_picker.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/common/dropdown_select.dart';
import 'package:let_tutor/core/utils/validators.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/edit-account/bloc/edit_account_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String learnerLevel = '';

  File? uploadImage;
  void selectImage() async {
    var res = await Helpers.pickImage();
    setState(() {
      uploadImage = res;
    });
  }

  List<MapEntry<String, String>> selectSubjects = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final accessToken = sl<SharedPreferences>().getString('access-token') ?? "";

  @override
  void initState() {
    context.read<EditAccountBloc>().add(
          GetAccount(
            accessToken: accessToken,
          ),
        );
    super.initState();
  }

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
    return BlocBuilder<EditAccountBloc, EditAccountState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is AccountLoading) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          );
        }
        if (state is AccountLoaded) {
          _nameController.text = state.user.name ?? '';
          _emailController.text = state.user.email ?? '';
          _phoneController.text = state.user.phone ?? '';
          _countryController.text =
              Helpers.countriesCodeToName[state.user.country] ??
                  state.user.country ??
                  '';
          _birthDateController.text = state.user.birthday ?? '';
          _scheduleController.text = state.user.studySchedule ?? '';
          learnerLevel = state.user.level ?? '';

          selectSubjects = [
            ...(state.user.learnTopics
                    ?.map((e) => MapEntry(e.key!, e.name!))
                    .toList() ??
                []),
            ...(state.user.testPreparations
                    ?.map((e) => MapEntry(e.key!, e.name!))
                    .toList() ??
                [])
          ];
        }
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
                    child: CachedNetworkImage(
                      imageUrl: state.user.avatar ??
                          Helpers.avatarFromName(state.user.name),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 50,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => const CircleAvatar(
                        radius: 50,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => CachedNetworkImage(
                        imageUrl: Helpers.avatarFromName(state.user.name),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 50,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) => const CircleAvatar(
                          radius: 50,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person),
                        ),
                      ),
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
                          readOnly: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomDatePicker(
                            labelText: AppLocalizations.of(context)!.birthday,
                            textEditingController: _birthDateController,
                            minDate: DateTime(1900),
                            showIcon: false,
                            initDate: DateTime.parse(
                                state.user.birthday ?? '2000-01-01'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownSelect(
                            options: AppConstants.learnerLevels.values.toList(),
                            labelText: AppLocalizations.of(context)!.myLevel,
                            initialValue:
                                AppConstants.learnerLevels[learnerLevel],
                            setValue: (String value) {
                              setState(() {
                                AppConstants.learnerLevels
                                    .forEach((key, value) {
                                  if (value == learnerLevel) {
                                    learnerLevel = key;
                                    return;
                                  }
                                });
                              });
                            },
                          ),
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
                                    AppConstants.specialtiesUser,
                                    selectSubjects,
                                    (List<MapEntry<dynamic, dynamic>> list) {
                                  setState(() {
                                    selectSubjects = list
                                        .map((e) =>
                                            e as MapEntry<String, String>)
                                        .toList();
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
                                    .map((e) => TagCard(name: e.value))
                                    .toList()
                                : [
                                    TagCard(
                                        name: AppLocalizations.of(context)!.all)
                                  ],
                          ),
                        ),
                        CustomTextField(
                            controller: _scheduleController,
                            labelText:
                                AppLocalizations.of(context)!.studySchedule,
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
      },
    );
  }
}
