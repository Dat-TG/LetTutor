import 'package:equatable/equatable.dart';

class TutorDetailsEntity extends Equatable {
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final String? accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  final double? rating;
  final bool? isNative;
  final String? youtubeVideoId;
  final bool? isFavorite;
  final double? avgRating;
  final int? totalFeedback;
  final UserEntity? user;
  const TutorDetailsEntity({
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.rating,
    this.isNative,
    this.youtubeVideoId,
    this.isFavorite,
    this.avgRating,
    this.totalFeedback,
    this.user,
  });

  @override
  List<Object?> get props {
    return [
      video,
      bio,
      education,
      experience,
      profession,
      accent,
      targetStudent,
      interests,
      languages,
      specialties,
      rating,
      isNative,
      youtubeVideoId,
      isFavorite,
      avgRating,
      totalFeedback,
      user,
    ];
  }
}

class UserEntity extends Equatable {
  final String? id;
  final String? level;
  final String? avatar;
  final String? name;
  final String? country;
  final String? language;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? zaloUserId;
  final String? studentGroupId;
  final List<CourseEntity>? courses;

  const UserEntity({
    this.id,
    this.level,
    this.avatar,
    this.name,
    this.country,
    this.language,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.studentGroupId,
    this.courses,
  });

  @override
  List<Object?> get props {
    return [
      id,
      level,
      avatar,
      name,
      country,
      language,
      isPublicRecord,
      caredByStaffId,
      zaloUserId,
      studentGroupId,
      courses,
    ];
  }
}

class CourseEntity extends Equatable {
  final String? id;
  final String? name;
  final TutorCourseEntity? tutorCourse;

  const CourseEntity({this.id, this.name, this.tutorCourse});

  @override
  List<Object?> get props => [id, name, tutorCourse];
}

class TutorCourseEntity extends Equatable {
  final String? userId;
  final String? courseId;
  final String? createdAt;
  final String? updatedAt;

  const TutorCourseEntity(
      {this.userId, this.courseId, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [userId, courseId, createdAt, updatedAt];
}
