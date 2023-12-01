import 'package:equatable/equatable.dart';

class CourseDetailsEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? reason;
  final String? purpose;
  final String? otherDetails;
  final int? defaultPrice;
  final int? coursePrice;
  final String? courseType;
  final String? sectionType;
  final bool? visible;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<TopicEntity>? topics;
  final List<UserEntity>? users;

  const CourseDetailsEntity({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.courseType,
    this.sectionType,
    this.visible,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.users,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        level,
        reason,
        purpose,
        otherDetails,
        defaultPrice,
        coursePrice,
        courseType,
        sectionType,
        visible,
        displayOrder,
        createdAt,
        updatedAt,
        topics,
        users,
      ];
}

class TopicEntity extends Equatable {
  final String? id;
  final String? courseId;
  final int? orderCourse;
  final String? name;
  final String? beforeTheClassNotes;
  final String? afterTheClassNotes;
  final String? nameFile;
  final int? numberOfPages;
  final String? description;
  final String? videoUrl;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TopicEntity({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.beforeTheClassNotes,
    this.afterTheClassNotes,
    this.nameFile,
    this.numberOfPages,
    this.description,
    this.videoUrl,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        courseId,
        orderCourse,
        name,
        beforeTheClassNotes,
        afterTheClassNotes,
        nameFile,
        numberOfPages,
        description,
        videoUrl,
        type,
        createdAt,
        updatedAt,
      ];
}

class UserEntity extends Equatable {
  final String? id;
  final String? level;
  final String? email;
  final String? google;
  final String? facebook;
  final String? apple;
  final String? password;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  final String? phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? zaloUserId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deletedAt;
  final String? studentGroupId;
  final TutorCourseEntity? tutorCourse;

  const UserEntity({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.password,
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
    this.tutorCourse,
  });

  @override
  List<Object?> get props => [
        id,
        level,
        email,
        google,
        facebook,
        apple,
        password,
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
        tutorCourse,
      ];
}

class TutorCourseEntity extends Equatable {
  final String? userId;
  final String? courseId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TutorCourseEntity({
    this.userId,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        userId,
        courseId,
        createdAt,
        updatedAt,
      ];
}
