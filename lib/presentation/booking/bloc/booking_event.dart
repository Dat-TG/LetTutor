part of 'booking_bloc.dart';

sealed class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

final class BookingScheduleFetched extends BookingEvent {
  final GetScheduleOfTutorUsecaseParams params;
  const BookingScheduleFetched(this.params);
}

final class BookingScheduleEvent extends BookingEvent {
  final BookingScheduleBody params;
  const BookingScheduleEvent(this.params);
}
