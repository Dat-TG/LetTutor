import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final String? userId;
  final String? scheduleDetailId;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final String? googleMeetLink;
  final String? studentRequest;
  final String? tutorReview;
  final double? scoreByTutor;
  final String? createdAt;
  final String? updatedAt;
  final String? recordUrl;
  final String? cancelReasonId;
  final int? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;
  final bool? isDeleted;
  final bool? isTrial;
  final int? convertedLesson;
  final ScheduleDetailInfoEntity? scheduleDetailInfo;
  final String? classReview;
  final String? trialBookingReview;
  final bool? showRecordUrl;
  final List<String>? studentMaterials;
  final List<FeedBackEntity>? feedbacks;

  const ScheduleEntity({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.googleMeetLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    this.isDeleted,
    this.isTrial,
    this.convertedLesson,
    this.scheduleDetailInfo,
    this.classReview,
    this.feedbacks,
    this.showRecordUrl,
    this.studentMaterials,
    this.trialBookingReview,
  });

  @override
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        userId,
        scheduleDetailId,
        tutorMeetingLink,
        studentMeetingLink,
        googleMeetLink,
        studentRequest,
        tutorReview,
        scoreByTutor,
        createdAt,
        updatedAt,
        recordUrl,
        cancelReasonId,
        lessonPlanId,
        cancelNote,
        calendarId,
        isDeleted,
        isTrial,
        convertedLesson,
        scheduleDetailInfo,
      ];
}

class ScheduleDetailInfoEntity extends Equatable {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final String? createdAt;
  final String? updatedAt;
  final ScheduleInfoEntity? scheduleInfo;

  const ScheduleDetailInfoEntity({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.scheduleInfo,
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
        scheduleInfo,
      ];
}

class ScheduleInfoEntity extends Equatable {
  final String? date;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  final TutorInfoEntity? tutorInfo;

  const ScheduleInfoEntity({
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.tutorInfo,
  });

  @override
  List<Object?> get props => [
        date,
        startTimestamp,
        endTimestamp,
        id,
        tutorId,
        startTime,
        endTime,
        isDeleted,
        createdAt,
        updatedAt,
        tutorInfo,
      ];
}

class TutorInfoEntity extends Equatable {
  final String? id;
  final String? level;
  final String? email;
  final String? google;
  final String? facebook;
  final String? apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final bool? requireNote;
  final int? timezone;
  final String? phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? zaloUserId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? studentGroupId;

  const TutorInfoEntity({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });

  @override
  List<Object?> get props => [
        id,
        level,
        email,
        google,
        facebook,
        apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        phoneAuth,
        isPhoneAuthActivated,
        studySchedule,
        canSendMessage,
        isPublicRecord,
        caredByStaffId,
        zaloUserId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
      ];
}

class FeedBackEntity extends Equatable {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final double? rating;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FeedBackEntity({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        bookingId,
        firstId,
        secondId,
        rating,
        content,
        createdAt,
        updatedAt,
      ];
}
