import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/upcoming_lesson/upcoming_lesson_entity.dart';
import 'package:let_tutor/domain/usecases/upcoming_lesson/get_upcoming_lesson.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'upcoming_lesson_event.dart';
part 'upcoming_lesson_state.dart';

class UpcomingLessonBloc
    extends Bloc<UpcomingLessonEvent, UpcomingLessonState> {
  final GetUpcomingLessonUsecase _getUpcomingLessonUsecase;
  final token = sl<SharedPreferences>().getString('access-token');
  UpcomingLessonBloc(this._getUpcomingLessonUsecase)
      : super(const UpcomingLessonLoading(UpcomingLessonEntity())) {
    on<UpcomingLessonFetched>(onUpcomingLessonFetched);
  }

  void onUpcomingLessonFetched(
      UpcomingLessonFetched event, Emitter<UpcomingLessonState> emit) async {
    emit(UpcomingLessonLoading(
      state.upcomingLesson ?? const UpcomingLessonEntity(),
    ));

    final dataState = await _getUpcomingLessonUsecase(
      params: token,
    );

    print('Fetch upcoming lesson: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      emit(UpcomingLessonDone(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(UpcomingLessonFailed(dataState.error!));
    }
  }
}
