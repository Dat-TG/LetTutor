import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_card.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_not_found_widget.dart';

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
                      child: Stack(
                        children: [
                          TutorCard(
                            isExpanded: true,
                            tutor: state.tutors![index],
                          ),
                          Positioned(
                            right: 20,
                            top: 10,
                            child: GestureDetector(
                              onTap: () {
                                context.read<TutorBloc>().add(
                                      FavoriteTutor(
                                        state.tutors![index].id ?? "",
                                        index,
                                        context,
                                      ),
                                    );
                              },
                              child:
                                  state.tutors?[index].isFavoriteTutor == true
                                      ? const Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.red,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return (state is TutorNotFound ||
                            (state is TutorUpdateFilters &&
                                state.tutors!.isEmpty))
                        ? const TutorNotFoundWidget()
                        : (state is TutorSearchComplete)
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
