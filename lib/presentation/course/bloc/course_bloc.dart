import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetListCoursesUsecase _getListCoursesUsecase;
  CourseBloc(this._getListCoursesUsecase) : super(const CourseLoading()) {
    on<CourseFetching>(onSearch);
  }

  void onSearch(CourseFetching event, Emitter<CourseState> emit) async {
    emit(CourseLoading(
      courses: state.courses,
      params: event.params.copyWith(page: state.params?.page ?? 0),
      error: state.error,
    ));
    final dataState = await _getListCoursesUsecase(params: event.params);
    print('page ${event.params.page}  ${dataState.data?.length}');
    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if ((event.params.page) > (state.params?.page ?? 0)) {
          emit(CourseDone(
            courses: [...(state.courses ?? []), ...(dataState.data ?? [])],
            params: event.params,
            error: state.error,
          ));
        } else {
          emit(CourseDone(
            courses: state.courses ?? [],
            params: event.params,
            error: state.error,
          ));
        }
      } else {
        if (event.params.page == 1 || state.courses!.isEmpty) {
          emit(CourseNotFound(
            courses: state.courses ?? [],
            params: event.params,
            error: state.error,
          ));
        } else {
          emit(CourseCompleted(
            courses: state.courses ?? [],
            params: event.params,
            error: state.error,
          ));
        }
      }
    }

    if (dataState is DataFailed) {
      emit(CourseFailed(
        courses: state.courses ?? [],
        params: event.params,
        error: dataState.error,
      ));
    }
  }
}
