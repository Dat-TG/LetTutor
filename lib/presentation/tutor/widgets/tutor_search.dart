import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_date_picker.dart';
import 'package:let_tutor/core/common/custom_time_picker.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/choose_nationality.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorSearch extends StatefulWidget {
  const TutorSearch({super.key});

  @override
  State<TutorSearch> createState() => _TutorSearchState();
}

class _TutorSearchState extends State<TutorSearch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorBloc, TutorState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: state.nameController,
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
                fontWeight: FontWeight.w700,
              ),
            ),
            ChooseNationality(
              isVN: state.isVN,
              isEN: state.isEN,
              isForeign: state.isForeign,
              setStateEN: (bool newValue) {
                context.read<TutorBloc>().add(
                      TutorUpdateIsEN(newValue),
                    );
              },
              setStateVN: (bool newValue) {
                context.read<TutorBloc>().add(
                      TutorUpdateIsVN(newValue),
                    );
              },
              setStateForeign: (bool newValue) {
                context.read<TutorBloc>().add(
                      TutorUpdateIsForeign(newValue),
                    );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.availableTutoringTime,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDatePicker(
              labelText: AppLocalizations.of(context)!.date,
              textEditingController: state.dateController,
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
                    textEditingController: state.startTimeController,
                    label: AppLocalizations.of(context)!.startTime,
                  ),
                ),
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 30,
                ),
                Expanded(
                  child: CustomTimePicker(
                    textEditingController: state.endTimeController,
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
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                title: AppLocalizations.of(context)!.chooseSpecialities,
                backgroundColor: Theme.of(context).splashColor,
                titleColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                callback: () {
                  Helpers.openFilterDialog(context, AppConstants.specialties,
                      state.selectedSpecialties,
                      (List<MapEntry<dynamic, dynamic>> list) {
                    context.read<TutorBloc>().add(
                          TutorUpdateSpecialties(list
                              .map((e) =>
                                  MapEntry(e.key as String, e.value as String))
                              .toList()),
                        );
                  });
                }),
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
                callback: () {
                  context.read<TutorBloc>().add(
                        TutorSearching(
                          context.read<TutorBloc>().state.params!.copyWith(
                                params: context
                                    .read<TutorBloc>()
                                    .state
                                    .params!
                                    .params
                                    .copyWith(
                                      search: state.nameController.text,
                                      page: 1,
                                      isNative: (state.isEN == state.isVN &&
                                              state.isVN == state.isForeign)
                                          ? null
                                          : state.isEN,
                                      isVietnamese: (state.isEN == state.isVN &&
                                              state.isVN == state.isForeign)
                                          ? null
                                          : state.isVN,
                                    ),
                              ),
                        ),
                      );
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
