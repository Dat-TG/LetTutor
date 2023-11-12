import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/all_tutors.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllTutorsScreen extends StatefulWidget {
  static const String routeName = 'allTutors';
  const AllTutorsScreen({super.key});

  @override
  State<AllTutorsScreen> createState() => _AllTutorsScreenState();
}

class _AllTutorsScreenState extends State<AllTutorsScreen> {
  final ScrollController _scrollController = ScrollController();
  final String accessToken = sl<SharedPreferences>().getString('access-token')!;
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (context.read<TutorBloc>().state is! TutorSearchComplete &&
          context.read<TutorBloc>().state is! TutorNotFound) {
        // Load more data
        context.read<TutorBloc>().add(
              TutorSearching(
                context.read<TutorBloc>().state.params!.copyWith(
                      token: accessToken,
                      params: context
                          .read<TutorBloc>()
                          .state
                          .params!
                          .params
                          .copyWith(
                            page: (context
                                        .read<TutorBloc>()
                                        .state
                                        .params!
                                        .params
                                        .page ??
                                    0) +
                                1,
                          ),
                    ),
              ),
            );
      }
    }
  }

  @override
  void initState() {
    if ((context.read<TutorBloc>().state.params?.params.page ?? 0) < 1) {
      context.read<TutorBloc>().add(
            TutorSearching(
              SearchTutorsUsecaseParams(
                token: accessToken,
                params: TutorSearchParams(page: 1),
              ),
            ),
          );
    }
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(
            title: AppLocalizations.of(context)!.recommendedTutors),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: TutorSearch(),
            ),
            AllTutors(),
          ],
        ),
      ),
    );
  }
}
