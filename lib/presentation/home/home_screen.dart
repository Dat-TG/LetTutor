import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/presentation/course/widgets/all_courses.dart';
import 'package:let_tutor/presentation/course/widgets/all_ebooks.dart';
import 'package:let_tutor/presentation/course/widgets/course_card.dart';
import 'package:let_tutor/presentation/ebook/widgets/ebook_card.dart';
import 'package:let_tutor/presentation/home/bloc/home_tutor_bloc.dart';
import 'package:let_tutor/presentation/home/widgets/home_banner.dart';
import 'package:let_tutor/presentation/home/widgets/recommended_row.dart';
import 'package:let_tutor/presentation/tutor/all_tutors_screen.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner
          const HomeBanner(),
          const SizedBox(
            height: 20,
          ),
          // Recommended Tutors
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: RecomendedRow(
              icon: ImageIcon(
                const AssetImage('assets/images/tutor.png'),
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              title: AppLocalizations.of(context)!.recommendedTutors,
              routeName: AllTutorsScreen.routeName,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<HomeTutorBloc, HomeTutorState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is TutorFetching) {
                return const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  ),
                );
              }
              if (state is TutorError) {
                return Center(
                  child: Text(state.error?.message ?? "Error"),
                );
              }
              return CarouselSlider(
                items: state.tutors!
                    .map(
                      (e) => TutorCard(
                        tutor: e,
                        isExpanded: false,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 328,
                  padEnds: false,
                  viewportFraction:
                      300 / MediaQuery.of(context).size.width + 0.05,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // Recommended Courses
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: RecomendedRow(
              icon: Icon(
                Icons.school_rounded,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              title: AppLocalizations.of(context)!.recommendedCourses,
              routeName: AllCourses.routeName,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: const [
              CourseCard(
                course: CourseEntity(),
              ),
              CourseCard(
                course: CourseEntity(),
              ),
              CourseCard(
                course: CourseEntity(),
              ),
              CourseCard(
                course: CourseEntity(),
              ),
            ],
            options: CarouselOptions(
              height: 311,
              viewportFraction: 250 / MediaQuery.of(context).size.width + 0.05,
              padEnds: false,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Recommended Ebooks
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: RecomendedRow(
              icon: Icon(
                Icons.book_rounded,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              title: AppLocalizations.of(context)!.recommendedEbooks,
              routeName: AllEbooks.routeName,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: const [
              EbookCard(
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
              EbookCard(
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
              EbookCard(
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
              EbookCard(
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
            ],
            options: CarouselOptions(
              height: 311,
              viewportFraction: 250 / MediaQuery.of(context).size.width + 0.05,
              padEnds: false,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
