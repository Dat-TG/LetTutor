import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_course_event.dart';
part 'home_course_state.dart';

class HomeCourseBloc extends Bloc<HomeCourseEvent, HomeCourseState> {
  final GetListCoursesUsecase _getListCoursesUsecase;
  final token = sl<SharedPreferences>().getString('access-token') ?? "";
  HomeCourseBloc(this._getListCoursesUsecase) : super(const CourseFetching()) {
    on<FetchCourse>(onFetch);
  }

  void onFetch(FetchCourse event, Emitter<HomeCourseState> emit) async {
    emit(const CourseFetching());

    final datastate = await _getListCoursesUsecase(
      params: GetListCoursesUsecaseParams(
        token: token,
        page: 1,
        size: 5,
      ),
    );

    if (datastate is DataSuccess) {
      emit(CourseFetched(courses: datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(CourseError(error: datastate.error!));
    }
  }
}
