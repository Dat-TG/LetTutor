import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';
import 'package:let_tutor/domain/usecases/tutor_schedule/get_schedule_of_tutor.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetScheduleOfTutorUsecase _getScheduleOfTutorUsecase;
  BookingBloc(this._getScheduleOfTutorUsecase)
      : super(const BookingLoadingTutorSchedule()) {
    on<BookingScheduleFetched>(onTutorScheduleFetched);
  }

  void onTutorScheduleFetched(
      BookingScheduleFetched event, Emitter<BookingState> emit) async {
    emit(BookingLoadingTutorSchedule(
        schedule: state.schedule, error: state.error, params: event.params));

    final dataState = await _getScheduleOfTutorUsecase(
      params: event.params,
    );

    print('Fetch tutor schedule: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      emit(BookingTutorScheduleDone(
          schedule: dataState.data ?? [],
          error: state.error,
          params: event.params));
    }

    if (dataState is DataFailed) {
      emit(BookingTutorScheduleFail(
        schedule: state.schedule ?? [],
        params: event.params,
        error: state.error,
      ));
    }
  }
}
