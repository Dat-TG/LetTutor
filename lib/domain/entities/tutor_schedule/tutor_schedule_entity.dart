import 'package:equatable/equatable.dart';

class ScheduleOfTutorEntity extends Equatable {
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? createdAt;
  final bool? isBooked;
  final List<ScheduleDetailsEntity>? scheduleDetails;

  const ScheduleOfTutorEntity({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.scheduleDetails,
  });

  @override
  List<Object?> get props => [
        id,
        tutorId,
        startTime,
        endTime,
        startTimestamp,
        endTimestamp,
        createdAt,
        isBooked,
        scheduleDetails,
      ];
}

class ScheduleDetailsEntity extends Equatable {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final String? createdAt;
  final String? updatedAt;
  final List<BookingInfoEntity>? bookingInfo;
  final bool? isBooked;

  const ScheduleDetailsEntity({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
  });

  @override
  List<Object?> get props => [
        startPeriodTimestamp,
        endPeriodTimestamp,
        id,
        scheduleId,
        startPeriod,
        endPeriod,
        createdAt,
        updatedAt,
        bookingInfo,
        isBooked,
      ];
}

class BookingInfoEntity extends Equatable {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final bool? isDeleted;
  final String? createdAt;
  final String? scheduleDetailId;
  final String? updatedAt;
  final int? cancelReasonId;
  final String? userId;

  const BookingInfoEntity({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.isDeleted,
    this.createdAt,
    this.scheduleDetailId,
    this.updatedAt,
    this.cancelReasonId,
    this.userId,
  });

  @override
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        isDeleted,
        createdAt,
        scheduleDetailId,
        updatedAt,
        cancelReasonId,
        userId,
      ];
}
