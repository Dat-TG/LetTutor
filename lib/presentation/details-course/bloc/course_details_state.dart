part of 'course_details_bloc.dart';

sealed class CourseDetailsState extends Equatable {
  final CourseDetailsEntity? courseDetailsEntity;
  final DioException? error;
  const CourseDetailsState({
    this.courseDetailsEntity,
    this.error,
  });

  @override
  List<Object?> get props => [
        courseDetailsEntity,
        error,
      ];
}

final class CourseDetailsLoading extends CourseDetailsState {
  const CourseDetailsLoading({
    CourseDetailsEntity? courseDetailsEntity,
    DioException? error,
  }) : super(
          courseDetailsEntity: courseDetailsEntity,
          error: error,
        );
}

final class CourseDetailsDone extends CourseDetailsState {
  const CourseDetailsDone({
    CourseDetailsEntity? courseDetailsEntity,
    DioException? error,
  }) : super(
          courseDetailsEntity: courseDetailsEntity,
          error: error,
        );
}

final class CourseDetailsFailed extends CourseDetailsState {
  const CourseDetailsFailed({
    CourseDetailsEntity? courseDetailsEntity,
    DioException? error,
  }) : super(
          courseDetailsEntity: courseDetailsEntity,
          error: error,
        );
}
