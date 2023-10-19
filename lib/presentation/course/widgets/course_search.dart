import 'package:flutter/material.dart';
import 'package:let_tutor/common/custom_button.dart';
import 'package:let_tutor/presentation/course/widgets/choose_sort_option.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';
import 'package:let_tutor/utils/constants.dart';
import 'package:let_tutor/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseSearch extends StatefulWidget {
  const CourseSearch({super.key});

  @override
  State<CourseSearch> createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  List<String> selectedLevels = [], selectedCategories = [];
  final TextEditingController sortOptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> sortOptions = [
      AppLocalizations.of(context)!.notSort,
      AppLocalizations.of(context)!.levelASC,
      AppLocalizations.of(context)!.levelDESC,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterCourseName,
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
          AppLocalizations.of(context)!.courseLevel,
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
            title: AppLocalizations.of(context)!.chooseLevel,
            backgroundColor: Colors.white,
            titleColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            callback: () {
              Helpers.openFilterDialog(
                  context, AppConstants.courseLevels, selectedLevels,
                  (List<String> list) {
                setState(() {
                  selectedLevels = list;
                });
              });
            }),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: (selectedLevels.length < AppConstants.courseLevels.length)
              ? selectedLevels.map((e) => TutorTag(name: e)).toList()
              : [const TutorTag(name: 'All')],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.courseCategory,
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
            title: AppLocalizations.of(context)!.chooseCategory,
            backgroundColor: Colors.white,
            titleColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            callback: () {
              Helpers.openFilterDialog(
                  context, AppConstants.courseCategories, selectedCategories,
                  (List<String> list) {
                setState(() {
                  selectedCategories = list;
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
              (selectedCategories.length < AppConstants.courseCategories.length)
                  ? selectedCategories.map((e) => TutorTag(name: e)).toList()
                  : [const TutorTag(name: 'All')],
        ),
        const SizedBox(
          height: 10,
        ),
        ChooseSortOption(
          sortOptionController: sortOptionController,
          sortOptions: sortOptions,
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
