import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/ebook_bloc.dart';
import 'package:let_tutor/presentation/course/widgets/course_not_found_widget.dart';
import 'package:let_tutor/presentation/ebook/widgets/ebook_card.dart';

class AllEbooks extends StatelessWidget {
  static const String routeName = 'allEbooks';
  const AllEbooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: BlocBuilder<EbookBloc, EbookState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (state.ebooks?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (state.ebooks?.length ?? 0)) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: EbookCard(
                        isExpanded: true,
                        ebook: state.ebooks![index],
                      ),
                    );
                  } else {
                    return (state is EbookNotFound)
                        ? const CourseNotFoundWidget()
                        : (state is EbookCompleted)
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
                });
          },
        ),
      ),
    );
  }
}
