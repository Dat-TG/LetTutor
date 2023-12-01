import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
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
    String? calendarId,
    bool? isDeleted,
    bool? isTrial,
    int? convertedLesson,
    ScheduleDetailInfoModel? scheduleDetailInfo,
    ClassReviewModel? classReview,
    String? trialBookingReview,
    bool? showRecordUrl,
    List<String>? studentMaterials,
    List<FeedBackModel>? feedbacks,
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
          classReview: classReview,
          feedbacks: feedbacks,
          showRecordUrl: showRecordUrl,
          studentMaterials: studentMaterials,
          trialBookingReview: trialBookingReview,
        );
  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
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
      scoreByTutor: json['scoreByTutor'] != null
          ? double.parse(json['scoreByTutor'].toString())
          : null,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      recordUrl: json['recordUrl'] as String?,
      cancelReasonId: json['cancelReasonId'] as String?,
      lessonPlanId: json['lessonPlanId'] as int?,
      cancelNote: json['cancelNote'] as String?,
      calendarId: json['calendarId'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isTrial: json['isTrial'] as bool?,
      convertedLesson: json['convertedLesson'] as int?,
      scheduleDetailInfo: json['scheduleDetailInfo'] != null
          ? ScheduleDetailInfoModel.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>)
          : null,
      classReview: json['classReview'] != null
          ? ClassReviewModel.fromJson(json['classReview'])
          : null,
      feedbacks: json['feedbacks'] != null
          ? (json['feedbacks'] as List)
              .map((e) => FeedBackModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      showRecordUrl: json['showRecordUrl'] as bool?,
      studentMaterials: json['studentMaterials'] != null
          ? (json['studentMaterials'] as List).map((e) => e as String).toList()
          : null,
      trialBookingReview: json['trialBookingReview'] as String?,
    );
  }
}

class ClassReviewModel extends ClassReviewEntity {
  const ClassReviewModel({
    String? bookingId,
    int? lessonStatusId,
    dynamic book,
    dynamic unit,
    dynamic lesson,
    dynamic page,
    String? lessonProgress,
    double? behaviorRating,
    String? behaviorComment,
    double? listeningRating,
    String? listeningComment,
    double? speakingRating,
    String? speakingComment,
    double? vocabularyRating,
    String? vocabularyComment,
    String? homeworkComment,
    String? overallComment,
    LessonStatusEntity? lessonStatus,
  }) : super(
          behaviorComment: behaviorComment,
          behaviorRating: behaviorRating,
          book: book,
          bookingId: bookingId,
          homeworkComment: homeworkComment,
          lesson: lesson,
          lessonProgress: lessonProgress,
          lessonStatus: lessonStatus,
          lessonStatusId: lessonStatusId,
          listeningComment: listeningComment,
          listeningRating: listeningRating,
          overallComment: overallComment,
          page: page,
          speakingComment: speakingComment,
          speakingRating: speakingRating,
          unit: unit,
          vocabularyComment: vocabularyComment,
          vocabularyRating: vocabularyRating,
        );

  factory ClassReviewModel.fromJson(Map<String, dynamic> json) {
    return ClassReviewModel(
      bookingId: json['bookingId'] as String?,
      lessonStatusId: json['lessonStatusId'] as int?,
      book: json['book'],
      unit: json['unit'],
      lesson: json['lesson'],
      page: json['page'],
      lessonProgress: json['lessonProgress'] as String?,
      behaviorRating: json['behaviorRating'] != null
          ? double.parse(json['behaviorRating'].toString())
          : null,
      behaviorComment: json['behaviorComment'] as String?,
      listeningRating: json['listeningRating'] != null
          ? double.parse(json['listeningRating'].toString())
          : null,
      listeningComment: json['listeningComment'] as String?,
      speakingRating: json['speakingRating'] != null
          ? double.parse(json['speakingRating'].toString())
          : null,
      speakingComment: json['speakingComment'] as String?,
      vocabularyRating: json['vocabularyRating'] != null
          ? double.parse(json['vocabularyRating'].toString())
          : null,
      vocabularyComment: json['vocabularyComment'] as String?,
      homeworkComment: json['homeworkComment'] as String?,
      overallComment: json['overallComment'] as String?,
      lessonStatus: json['lessonStatus'] != null
          ? LessonStatusModel.fromJson(
              json['lessonStatus'] as Map<String, dynamic>)
          : null,
    );
  }
}

class LessonStatusModel extends LessonStatusEntity {
  const LessonStatusModel({
    int? id,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory LessonStatusModel.fromJson(Map<String, dynamic> json) {
    return LessonStatusModel(
      id: json['id'] as int?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
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

class FeedBackModel extends FeedBackEntity {
  const FeedBackModel({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    double? rating,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          bookingId: bookingId,
          content: content,
          createdAt: createdAt,
          firstId: firstId,
          id: id,
          rating: rating,
          secondId: secondId,
          updatedAt: updatedAt,
        );

  factory FeedBackModel.fromJson(Map<String, dynamic> json) {
    return FeedBackModel(
      id: json['id'] as String?,
      bookingId: json['bookingId'] as String?,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      rating: json['rating'] != null
          ? double.parse(json['rating'].toString())
          : null,
      content: json['content'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }
}
