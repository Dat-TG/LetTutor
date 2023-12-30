// ignore_for_file: use_build_context_synchronously

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
import 'package:let_tutor/domain/repositories/user/user_repository.dart';
import 'package:let_tutor/presentation/edit-account/bloc/edit_account_bloc.dart';
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
      _countryNameController = TextEditingController(text: 'Viet Nam'),
      _countryCodeController = TextEditingController(text: 'VN'),
      _birthDateController = TextEditingController(text: '2002-10-13'),
      _scheduleController = TextEditingController(),
      _levelController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<EditAccountBloc>().add(
          const GetAccount(),
        );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _countryNameController.dispose();
    _countryCodeController.dispose();
    _birthDateController.dispose();
    _scheduleController.dispose();
    _levelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void selectImage() async {
      var res = await Helpers.pickImage();
      print('result upload image: $res');
      if (res != null) {
        context
            .read<EditAccountBloc>()
            .add(UploadAvatar(image: res, context: context));
      }
    }

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
          _countryCodeController.text = state.user.country ?? '';
          _countryNameController.text =
              Helpers.countriesCodeToName[state.user.country] ??
                  state.user.country ??
                  '';
          _birthDateController.text = state.user.birthday ?? '';
          _scheduleController.text = state.user.studySchedule ?? '';
          _levelController.text = state.user.level ?? '';

          context.read<EditAccountBloc>().add(SelectSubjects(subjects: [
                ...(state.user.learnTopics
                        ?.map((e) => MapEntry('${e.id}${e.key}', e.name!))
                        .toList() ??
                    []),
                ...(state.user.testPreparations
                        ?.map((e) => MapEntry('${e.id}${e.key}', e.name!))
                        .toList() ??
                    [])
              ]));
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
                  child: (state is! AvatarUploading)
                      ? InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () async {
                            selectImage();
                          },
                          child: CachedNetworkImage(
                            imageUrl: state.user.avatar ??
                                Helpers.avatarFromName(state.user.name),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
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
                                CachedNetworkImage(
                              imageUrl: Helpers.avatarFromName(state.user.name),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
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
                        )
                      : const Center(
                          child: CircleAvatar(
                            radius: 50,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Colors.white,
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
                      children: [
                        const TextSpan(
                          text: 'ID: ',
                        ),
                        TextSpan(text: state.user.id ?? ''),
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
                          controller: _countryNameController,
                          labelText: AppLocalizations.of(context)!.country,
                          readOnly: true,
                          onTap: () {
                            showCountryPicker(
                              context: context, useSafeArea: true,
                              showPhoneCode:
                                  false, // optional. Shows phone code before the country name.
                              onSelect: (Country country) {
                                _countryCodeController.text =
                                    country.countryCode;
                                _countryNameController.text = country.name;
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
                            initialValue: AppConstants
                                .learnerLevels[_levelController.text],
                            setValue: (String value) {
                              AppConstants.learnerLevels
                                  .forEach((key, mapValue) {
                                if (value == mapValue) {
                                  _levelController.text = key;
                                  return;
                                }
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
                                    state.selectSubjects,
                                    (List<MapEntry<dynamic, dynamic>> list) {
                                  context.read<EditAccountBloc>().add(
                                      SelectSubjects(
                                          subjects: list
                                              .map((e) =>
                                                  e as MapEntry<String, String>)
                                              .toList()));
                                });
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: (state.selectSubjects.length <
                                    AppConstants.specialties.length)
                                ? state.selectSubjects
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
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 200,
                    child: CustomButton(
                      isInProgress: state is InfoUpdating,
                      borderRadius: 10,
                      textSize: 18,
                      title: AppLocalizations.of(context)!.saveChanges,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          List<String> learnTopics = [], testPreparations = [];
                          for (int i = 0;
                              i < state.selectSubjects.length;
                              i++) {
                            if (state.selectSubjects[i].key ==
                                    AppConstants.specialtiesUser.keys
                                        .elementAt(0) ||
                                state.selectSubjects[i].key ==
                                    AppConstants.specialtiesUser.keys
                                        .elementAt(1) ||
                                state.selectSubjects[i].key ==
                                    AppConstants.specialtiesUser.keys
                                        .elementAt(2)) {
                              learnTopics.add(state.selectSubjects[i].key[0]);
                            } else {
                              testPreparations
                                  .add(state.selectSubjects[i].key[0]);
                            }
                          }
                          context.read<EditAccountBloc>().add(
                                UpdateAccount(
                                  userInfoBody: UserInfoBody(
                                    birthday: _birthDateController.text,
                                    country: _countryCodeController.text,
                                    learnTopics: learnTopics,
                                    level: _levelController.text,
                                    name: _nameController.text,
                                    phone: _phoneController.text,
                                    studySchedule: _scheduleController.text,
                                    testPreparations: testPreparations,
                                  ),
                                  context: context,
                                ),
                              );
                        }
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
