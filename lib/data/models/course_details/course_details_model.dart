import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';

class CourseDetailsModel extends CourseDetailsEntity {
  const CourseDetailsModel({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    String? reason,
    String? purpose,
    String? otherDetails,
    int? defaultPrice,
    int? coursePrice,
    String? courseType,
    String? sectionType,
    bool? visible,
    int? displayOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<TopicModel>? topics,
    List<UserModel>? users,
  }) : super(
          coursePrice: coursePrice,
          courseType: courseType,
          createdAt: createdAt,
          defaultPrice: defaultPrice,
          description: description,
          displayOrder: displayOrder,
          id: id,
          imageUrl: imageUrl,
          level: level,
          name: name,
          otherDetails: otherDetails,
          purpose: purpose,
          reason: reason,
          sectionType: sectionType,
          topics: topics,
          updatedAt: updatedAt,
          users: users,
          visible: visible,
        );

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      level: json['level'],
      reason: json['reason'],
      purpose: json['purpose'],
      otherDetails: json['otherDetails'],
      defaultPrice: json['defaultPrice'],
      coursePrice: json['coursePrice'],
      courseType: json['courseType'],
      sectionType: json['sectionType'],
      visible: json['visible'],
      displayOrder: json['displayOrder'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      topics: (json['topics'] as List<dynamic>)
          .map((topicJson) => TopicModel.fromJson(topicJson))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList(),
    );
  }
}

class TutorCourseModel extends TutorCourseEntity {
  const TutorCourseModel({
    String? userId,
    String? courseId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          courseId: courseId,
          userId: userId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory TutorCourseModel.fromJson(Map<String, dynamic> json) {
    return TutorCourseModel(
      userId: json['UserId'],
      courseId: json['CourseId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    String? id,
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? password,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    bool? isPhoneActivated,
    String? requireNote,
    int? timezone,
    String? phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? deletedAt,
    String? studentGroupId,
    TutorCourseModel? tutorCourse,
  }) : super(
          apple: apple,
          avatar: avatar,
          birthday: birthday,
          canSendMessage: canSendMessage,
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
          name: name,
          password: password,
          phone: phone,
          phoneAuth: phoneAuth,
          requireNote: requireNote,
          requestPassword: requestPassword,
          studySchedule: studySchedule,
          timezone: timezone,
          updatedAt: updatedAt,
          zaloUserId: zaloUserId,
          studentGroupId: studentGroupId,
          tutorCourse: tutorCourse,
          level: level,
          caredByStaffId: caredByStaffId,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      level: json['level'],
      email: json['email'],
      google: json['google'],
      facebook: json['facebook'],
      apple: json['apple'],
      password: json['password'],
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      phone: json['phone'],
      language: json['language'],
      birthday: json['birthday'],
      requestPassword: json['requestPassword'],
      isActivated: json['isActivated'],
      isPhoneActivated: json['isPhoneActivated'],
      requireNote: json['requireNote'],
      timezone: json['timezone'],
      phoneAuth: json['phoneAuth'],
      isPhoneAuthActivated: json['isPhoneAuthActivated'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      isPublicRecord: json['isPublicRecord'],
      caredByStaffId: json['caredByStaffId'],
      zaloUserId: json['zaloUserId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'],
      studentGroupId: json['studentGroupId'],
      tutorCourse: TutorCourseModel.fromJson(json['TutorCourse']),
    );
  }
}

class TopicModel extends TopicEntity {
  const TopicModel({
    String? id,
    String? courseId,
    int? orderCourse,
    String? name,
    String? beforeTheClassNotes,
    String? afterTheClassNotes,
    String? nameFile,
    int? numberOfPages,
    String? description,
    String? videoUrl,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          afterTheClassNotes: afterTheClassNotes,
          beforeTheClassNotes: beforeTheClassNotes,
          courseId: courseId,
          createdAt: createdAt,
          description: description,
          id: id,
          name: name,
          nameFile: nameFile,
          numberOfPages: numberOfPages,
          orderCourse: orderCourse,
          type: type,
          updatedAt: updatedAt,
          videoUrl: videoUrl,
        );

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'],
      courseId: json['courseId'],
      orderCourse: json['orderCourse'],
      name: json['name'],
      beforeTheClassNotes: json['beforeTheClassNotes'],
      afterTheClassNotes: json['afterTheClassNotes'],
      nameFile: json['nameFile'],
      numberOfPages: json['numberOfPages'],
      description: json['description'],
      videoUrl: json['videoUrl'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
