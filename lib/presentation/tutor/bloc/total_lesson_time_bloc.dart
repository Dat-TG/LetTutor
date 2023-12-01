import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/usecases/total_lesson_time/get_total_lesson_time.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'total_lesson_time_event.dart';
part 'total_lesson_time_state.dart';

class TotalLessonTimeBloc
    extends Bloc<TotalLessonTimeEvent, TotalLessonTimeState> {
  final GetTotalLessonTimeUsecase _getTotalLessonTime;
  final token = sl<SharedPreferences>().getString('access-token')!;
  TotalLessonTimeBloc(this._getTotalLessonTime)
      : super(const TotalLessonTimeLoading(0)) {
    on<TotalLessonTimeFetched>(onTotalLessonTimeFetched);
  }

  void onTotalLessonTimeFetched(
      TotalLessonTimeFetched event, Emitter<TotalLessonTimeState> emit) async {
    emit(TotalLessonTimeLoading(
      state.totalLessonTime ?? 0,
    ));

    final dataState = await _getTotalLessonTime(
      params: token,
    );

    print('Fetch total time: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(TotalLessonTimeDone(dataState.data ?? 0));
      } else {
        emit(TotalLessonTimeFailed(dataState.error!));
      }
    }

    if (dataState is DataFailed) {
      emit(TotalLessonTimeFailed(dataState.error!));
    }
  }
}
