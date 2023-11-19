import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';
import 'package:let_tutor/domain/usecases/course_details/get_course_details.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  final GetCourseDetailsUsecase _getCourseDetailsUsecase;
  final accessToken = sl<SharedPreferences>().getString('access-token');
  CourseDetailsBloc(this._getCourseDetailsUsecase)
      : super(const CourseDetailsLoading()) {
    on<CourseDetailsFetching>(onLoad);
  }

  void onLoad(
      CourseDetailsFetching event, Emitter<CourseDetailsState> emit) async {
    emit(const CourseDetailsLoading());
    final dataState = await _getCourseDetailsUsecase(
      params: GetCourseDetailsUsecaseParams(
        token: accessToken ?? "",
        courseId: event.courseId,
      ),
    );
    if (dataState is DataSuccess) {
      emit(CourseDetailsDone(
        courseDetailsEntity: dataState.data,
        error: dataState.error,
      ));
    } else if (dataState is DataFailed) {
      emit(CourseDetailsFailed(
        courseDetailsEntity: dataState.data,
        error: dataState.error,
      ));
    }
  }
}
