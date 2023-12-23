import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';
import 'package:let_tutor/domain/usecases/tutor_schedule/booking_schedule.dart';
import 'package:let_tutor/domain/usecases/tutor_schedule/get_schedule_of_tutor.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/injection_container.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetScheduleOfTutorUsecase _getScheduleOfTutorUsecase;
  final BookingScheduleUsecase _bookingScheduleUsecase;
  final GetUserUsecase _getUserUsecase;
  BookingBloc(this._getScheduleOfTutorUsecase, this._bookingScheduleUsecase,
      this._getUserUsecase)
      : super(const BookingLoadingTutorSchedule()) {
    on<BookingScheduleFetched>(onTutorScheduleFetched);
    on<BookingScheduleEvent>(onBooking);
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

  void onBooking(BookingScheduleEvent event, Emitter<BookingState> emit) async {
    final dataState = await _bookingScheduleUsecase(
      params: event.params,
    );

    print('onBooking: ${dataState.data!}');

    if (dataState is DataSuccess) {
      final user = await _getUserUsecase();
      if (dataState is DataSuccess && dataState.data != null) {
        sl<AuthProvider>().setUser(user.data!);
      }
      emit(BookingScheduleDone(
          schedule: state.schedule, error: state.error, params: state.params));
    }

    if (dataState is DataFailed) {
      emit(BookingScheduleFailed(
          schedule: state.schedule, error: state.error, params: state.params));
    }
  }
}
