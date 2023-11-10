import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllTutors extends StatefulWidget {
  static const String routeName = 'allTutors';
  const AllTutors({super.key});

  @override
  State<AllTutors> createState() => _AllTutorsState();
}

class _AllTutorsState extends State<AllTutors> {
  @override
  void initState() {
    context.read<TutorBloc>().add(
          TutorSearch(
            SearchTutorsUsecaseParams(
              token: sl<SharedPreferences>().getString('access-token')!,
              params: TutorSearchParams(),
            ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorBloc, TutorState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                if (state.tutors != null)
                  for (int i = 0; i < state.tutors!.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: TutorCard(
                        isExpanded: true,
                        tutor: state.tutors![i],
                      ),
                    ),
                if (state is TutorSearchInProgress)
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
