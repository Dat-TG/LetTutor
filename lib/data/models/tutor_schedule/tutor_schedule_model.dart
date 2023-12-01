import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';

class ScheduleOfTutorModel extends ScheduleOfTutorEntity {
  const ScheduleOfTutorModel({
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    int? startTimestamp,
    int? endTimestamp,
    String? createdAt,
    bool? isBooked,
    List<ScheduleDetailsEntity>? scheduleDetails,
  }) : super(
          createdAt: createdAt,
          endTime: endTime,
          endTimestamp: endTimestamp,
          id: id,
          isBooked: isBooked,
          scheduleDetails: scheduleDetails,
          startTime: startTime,
          startTimestamp: startTimestamp,
          tutorId: tutorId,
        );
  factory ScheduleOfTutorModel.fromJson(Map<String, dynamic> json) {
    return ScheduleOfTutorModel(
      id: json['id'],
      tutorId: json['tutorId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      startTimestamp: json['startTimestamp'],
      endTimestamp: json['endTimestamp'],
      createdAt: json['createdAt'],
      isBooked: json['isBooked'],
      scheduleDetails: (json['scheduleDetails'] as List<dynamic>?)
          ?.map((e) => ScheduleDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ScheduleDetailsModel extends ScheduleDetailsEntity {
  const ScheduleDetailsModel({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    String? createdAt,
    String? updatedAt,
    List<BookingInfoEntity>? bookingInfo,
    bool? isBooked,
  }) : super(
          bookingInfo: bookingInfo,
          createdAt: createdAt,
          endPeriod: endPeriod,
          endPeriodTimestamp: endPeriodTimestamp,
          id: id,
          isBooked: isBooked,
          scheduleId: scheduleId,
          startPeriod: startPeriod,
          startPeriodTimestamp: startPeriodTimestamp,
          updatedAt: updatedAt,
        );
  factory ScheduleDetailsModel.fromJson(Map<String, dynamic> json) {
    return ScheduleDetailsModel(
      startPeriodTimestamp: json['startPeriodTimestamp'],
      endPeriodTimestamp: json['endPeriodTimestamp'],
      id: json['id'],
      scheduleId: json['scheduleId'],
      startPeriod: json['startPeriod'],
      endPeriod: json['endPeriod'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      bookingInfo: (json['bookingInfo'] as List<dynamic>?)
          ?.map((e) => BookingInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBooked: json['isBooked'],
    );
  }
}

class BookingInfoModel extends BookingInfoEntity {
  const BookingInfoModel({
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? id,
    bool? isDeleted,
    String? createdAt,
    String? scheduleDetailId,
    String? updatedAt,
    int? cancelReasonId,
    String? userId,
  }) : super(
          cancelReasonId: cancelReasonId,
          createdAt: createdAt,
          createdAtTimeStamp: createdAtTimeStamp,
          id: id,
          isDeleted: isDeleted,
          scheduleDetailId: scheduleDetailId,
          updatedAt: updatedAt,
          updatedAtTimeStamp: updatedAtTimeStamp,
          userId: userId,
        );

  factory BookingInfoModel.fromJson(Map<String, dynamic> json) {
    return BookingInfoModel(
      createdAtTimeStamp: json['createdAtTimeStamp'],
      updatedAtTimeStamp: json['updatedAtTimeStamp'],
      id: json['id'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      scheduleDetailId: json['scheduleDetailId'],
      updatedAt: json['updatedAt'],
      cancelReasonId: json['cancelReasonId'],
      userId: json['userId'],
    );
  }
}
