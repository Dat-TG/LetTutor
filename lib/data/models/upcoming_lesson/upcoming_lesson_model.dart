import 'package:let_tutor/domain/entities/upcoming_lesson/upcoming_lesson_entity.dart';

class UpcomingLessonModel extends UpcomingLessonEntity {
  const UpcomingLessonModel({
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? id,
    String? userId,
    String? scheduleDetailId,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    String? googleMeetLink,
    String? studentRequest,
    String? tutorReview,
    double? scoreByTutor,
    String? createdAt,
    String? updatedAt,
    String? recordUrl,
    String? cancelReasonId,
    int? lessonPlanId,
    String? cancelNote,
    int? calendarId,
    bool? isDeleted,
    bool? isTrial,
    int? convertedLesson,
    ScheduleDetailInfoModel? scheduleDetailInfo,
  }) : super(
          calendarId: calendarId,
          cancelNote: cancelNote,
          cancelReasonId: cancelReasonId,
          convertedLesson: convertedLesson,
          createdAt: createdAt,
          createdAtTimeStamp: createdAtTimeStamp,
          googleMeetLink: googleMeetLink,
          id: id,
          isDeleted: isDeleted,
          isTrial: isTrial,
          lessonPlanId: lessonPlanId,
          recordUrl: recordUrl,
          scheduleDetailId: scheduleDetailId,
          scheduleDetailInfo: scheduleDetailInfo,
          scoreByTutor: scoreByTutor,
          studentMeetingLink: studentMeetingLink,
          studentRequest: studentRequest,
          tutorMeetingLink: tutorMeetingLink,
          tutorReview: tutorReview,
          updatedAt: updatedAt,
          updatedAtTimeStamp: updatedAtTimeStamp,
          userId: userId,
        );
  factory UpcomingLessonModel.fromJson(Map<String, dynamic> json) {
    return UpcomingLessonModel(
      createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      studentMeetingLink: json['studentMeetingLink'] as String?,
      googleMeetLink: json['googleMeetLink'] as String?,
      studentRequest: json['studentRequest'] as String?,
      tutorReview: json['tutorReview'] as String?,
      scoreByTutor: json['scoreByTutor'] as double?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      recordUrl: json['recordUrl'] as String?,
      cancelReasonId: json['cancelReasonId'] as String?,
      lessonPlanId: json['lessonPlanId'] as int?,
      cancelNote: json['cancelNote'] as String?,
      calendarId: json['calendarId'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      isTrial: json['isTrial'] as bool?,
      convertedLesson: json['convertedLesson'] as int?,
      scheduleDetailInfo: json['scheduleDetailInfo'] != null
          ? ScheduleDetailInfoModel.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class TutorInfoModel extends TutorInfoEntity {
  const TutorInfoModel({
    String? id,
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    bool? isPhoneActivated,
    bool? requireNote,
    int? timezone,
    String? phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? studentGroupId,
  }) : super(
          apple: apple,
          avatar: avatar,
          birthday: birthday,
          canSendMessage: canSendMessage,
          caredByStaffId: caredByStaffId,
          country: country,
          createdAt: createdAt,
          deletedAt: deletedAt,
          email: email,
          facebook: facebook,
          google: google,
          id: id,
          isActivated: isActivated,
          isPhoneActivated: isPhoneActivated,
          isPhoneAuthActivated: isPhoneAuthActivated,
          isPublicRecord: isPublicRecord,
          language: language,
          level: level,
          name: name,
          phone: phone,
          phoneAuth: phoneAuth,
          requestPassword: requestPassword,
          requireNote: requireNote,
          studySchedule: studySchedule,
          timezone: timezone,
          updatedAt: updatedAt,
          zaloUserId: zaloUserId,
          studentGroupId: studentGroupId,
        );

  factory TutorInfoModel.fromJson(Map<String, dynamic> json) {
    return TutorInfoModel(
      id: json['id'] as String?,
      level: json['level'] as String?,
      email: json['email'] as String?,
      google: json['google'] as String?,
      facebook: json['facebook'] as String?,
      apple: json['apple'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      requireNote: json['requireNote'] as bool?,
      timezone: json['timezone'] as int?,
      phoneAuth: json['phoneAuth'] as String?,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      caredByStaffId: json['caredByStaffId'] as String?,
      zaloUserId: json['zaloUserId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      studentGroupId: json['studentGroupId'] as String?,
    );
  }
}

class ScheduleInfoModel extends ScheduleInfoEntity {
  const ScheduleInfoModel({
    String? date,
    int? startTimestamp,
    int? endTimestamp,
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    TutorInfoModel? tutorInfo,
  }) : super(
          createdAt: createdAt,
          date: date,
          endTime: endTime,
          endTimestamp: endTimestamp,
          id: id,
          isDeleted: isDeleted,
          startTimestamp: startTimestamp,
          startTime: startTime,
          tutorId: tutorId,
          tutorInfo: tutorInfo,
          updatedAt: updatedAt,
        );
  factory ScheduleInfoModel.fromJson(Map<String, dynamic> json) {
    return ScheduleInfoModel(
      date: json['date'] as String?,
      startTimestamp: json['startTimestamp'] as int?,
      endTimestamp: json['endTimestamp'] as int?,
      id: json['id'] as String?,
      tutorId: json['tutorId'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tutorInfo:
          TutorInfoModel.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );
  }
}

class ScheduleDetailInfoModel extends ScheduleDetailInfoEntity {
  const ScheduleDetailInfoModel({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    String? createdAt,
    String? updatedAt,
    ScheduleInfoModel? scheduleInfo,
  }) : super(
          createdAt: createdAt,
          scheduleId: scheduleId,
          endPeriod: endPeriod,
          endPeriodTimestamp: endPeriodTimestamp,
          id: id,
          scheduleInfo: scheduleInfo,
          startPeriod: startPeriod,
          startPeriodTimestamp: startPeriodTimestamp,
          updatedAt: updatedAt,
        );

  factory ScheduleDetailInfoModel.fromJson(Map<String, dynamic> json) {
    return ScheduleDetailInfoModel(
      startPeriodTimestamp: json['startPeriodTimestamp'],
      endPeriodTimestamp: json['endPeriodTimestamp'],
      id: json['id'],
      scheduleId: json['scheduleId'],
      startPeriod: json['startPeriod'],
      endPeriod: json['endPeriod'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      scheduleInfo: ScheduleInfoModel.fromJson(json['scheduleInfo']),
    );
  }
}
