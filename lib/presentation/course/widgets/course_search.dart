import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';
import 'package:let_tutor/domain/usecases/ebook/get_list_ebooks.dart';
import 'package:let_tutor/presentation/course/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/ebook_bloc.dart';
import 'package:let_tutor/presentation/course/widgets/choose_sort_option.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseSearch extends StatefulWidget {
  const CourseSearch({super.key});

  @override
  State<CourseSearch> createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, String>> sortOptions = [
      MapEntry('', AppLocalizations.of(context)!.notSort),
      MapEntry('ASC', AppLocalizations.of(context)!.levelASC),
      MapEntry('DESC', AppLocalizations.of(context)!.levelDESC),
    ];
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
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
              controller: state.q,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.courseLevel,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                title: AppLocalizations.of(context)!.chooseLevel,
                backgroundColor: Theme.of(context).splashColor,
                titleColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                callback: () {
                  Helpers.openFilterDialog(
                      context, AppConstants.courseLevels, state.level!,
                      (List<MapEntry<dynamic, dynamic>> list) {
                    print('event update level');
                    context.read<CourseBloc>().add(
                          CourseUpdateLevel(
                            level: list
                                .map(
                                  (e) =>
                                      MapEntry(e.key as int, e.value as String),
                                )
                                .toList(),
                          ),
                        );
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: (state.level!.length < AppConstants.courseLevels.length)
                  ? state.level!.map((e) => TagCard(name: e.value)).toList()
                  : [TagCard(name: AppLocalizations.of(context)!.all)],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.courseCategory,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                title: AppLocalizations.of(context)!.chooseCategory,
                backgroundColor: Theme.of(context).splashColor,
                titleColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                callback: () {
                  Helpers.openFilterDialog(
                      context, AppConstants.courseCategories, state.categoryId!,
                      (List<MapEntry<dynamic, dynamic>> list) {
                    print('event update category');
                    context.read<CourseBloc>().add(
                          CourseUpdateCategoryId(
                            categoryId: list
                                .map(
                                  (e) => MapEntry(
                                      e.key as String, e.value as String),
                                )
                                .toList(),
                          ),
                        );
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: (state.categoryId!.length <
                      AppConstants.courseCategories.length)
                  ? state.categoryId!
                      .map((e) => TagCard(name: e.value))
                      .toList()
                  : [TagCard(name: AppLocalizations.of(context)!.all)],
            ),
            const SizedBox(
              height: 10,
            ),
            ChooseSortOption(
              sortOptionController: state.orderBy!,
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
                callback: () {
                  context.read<CourseBloc>().add(
                        CourseFetching(
                          params: GetListCoursesUsecaseParams(
                            page: 1,
                            size: 5,
                            level: state.level!.map((e) => e.key).toList(),
                            categoryId:
                                state.categoryId!.map((e) => e.key).toList(),
                            order:
                                state.orderBy!.text.isNotEmpty ? 'level' : null,
                            orderBy: state.orderBy!.text,
                            q: state.q!.text,
                          ),
                        ),
                      );
                  context.read<EbookBloc>().add(
                        EbookFetching(
                          params: GetListEbooksUsecaseParams(
                            page: 1,
                            size: 5,
                            level: state.level!.map((e) => e.key).toList(),
                            categoryId:
                                state.categoryId!.map((e) => e.key).toList(),
                            order:
                                state.orderBy!.text.isNotEmpty ? 'level' : null,
                            orderBy: state.orderBy!.text,
                            q: state.q!.text,
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
