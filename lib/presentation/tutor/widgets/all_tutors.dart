import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_card.dart';

class AllTutors extends StatefulWidget {
  const AllTutors({super.key});

  @override
  State<AllTutors> createState() => _AllTutorsState();
}

class _AllTutorsState extends State<AllTutors> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorBloc, TutorState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (state.tutors?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (state.tutors?.length ?? 0)) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: TutorCard(
                        isExpanded: true,
                        tutor: state.tutors![index],
                      ),
                    );
                  } else {
                    return (state is TutorNotFound)
                        ? const SizedBox()
                        : const Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          );
                  }
                }),
          ),
        );
      },
    );
  }
}
