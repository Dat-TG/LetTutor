import 'package:flutter/material.dart';
import 'package:let_tutor/common/custom_button.dart';
import 'package:let_tutor/common/custom_date_picker.dart';
import 'package:let_tutor/common/custom_time_picker.dart';
import 'package:let_tutor/presentation/course/widgets/choose_sort_option.dart';
import 'package:let_tutor/presentation/tutor/widgets/choose_nationality.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';
import 'package:let_tutor/utils/constants.dart';
import 'package:let_tutor/utils/helpers.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: 'Enter course name...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Course level',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
            title: 'Choose level',
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
        const Text(
          'Course category',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
            title: 'Choose category',
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
        ChooseSortOption(sortOptionController: sortOptionController),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            title: 'Search',
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
