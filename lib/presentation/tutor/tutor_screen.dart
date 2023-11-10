import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/all_tutors.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_search.dart';
import 'package:let_tutor/presentation/tutor/widgets/upcoming_lesson.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorScreen extends StatefulWidget {
  static const String routeName = 'tutorListScreen';
  const TutorScreen({super.key});

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  final ScrollController _scrollController = ScrollController();
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Load more data
      context.read<TutorBloc>().add(
            TutorSearching(
              SearchTutorsUsecaseParams(
                token: sl<SharedPreferences>().getString('access-token')!,
                params: TutorSearchParams(
                    page: context.read<TutorBloc>().state.page! + 1),
              ),
            ),
          );
    }
  }

  @override
  void initState() {
    context.read<TutorBloc>().add(
          TutorSearching(
            SearchTutorsUsecaseParams(
              token: sl<SharedPreferences>().getString('access-token')!,
              params: TutorSearchParams(page: 1),
            ),
          ),
        );
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorBloc, TutorState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UpcomingLesson(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.findATutor,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TutorSearch(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppLocalizations.of(context)!.recommendedTutors,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const AllTutors(),
            ],
          ),
        );
      },
    );
  }
}
