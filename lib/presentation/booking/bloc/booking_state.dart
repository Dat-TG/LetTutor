part of 'booking_bloc.dart';

sealed class BookingState extends Equatable {
  final List<ScheduleOfTutorEntity>? schedule;
  final DioException? error;
  final GetScheduleOfTutorUsecaseParams? params;
  const BookingState({
    this.schedule,
    this.error,
    this.params,
  });

  @override
  List<Object> get props => [];
}

final class BookingLoadingTutorSchedule extends BookingState {
  const BookingLoadingTutorSchedule({
    List<ScheduleOfTutorEntity>? schedule,
    DioException? error,
    GetScheduleOfTutorUsecaseParams? params,
  }) : super(
          schedule: schedule,
          error: error,
          params: params,
        );
}

final class BookingTutorScheduleDone extends BookingState {
  const BookingTutorScheduleDone({
    List<ScheduleOfTutorEntity>? schedule,
    DioException? error,
    GetScheduleOfTutorUsecaseParams? params,
  }) : super(
          schedule: schedule,
          error: error,
          params: params,
        );
}

final class BookingTutorScheduleFail extends BookingState {
  const BookingTutorScheduleFail({
    List<ScheduleOfTutorEntity>? schedule,
    DioException? error,
    GetScheduleOfTutorUsecaseParams? params,
  }) : super(
          schedule: schedule,
          error: error,
          params: params,
        );
}
