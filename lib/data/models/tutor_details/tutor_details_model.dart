import 'package:let_tutor/domain/entities/tutor_details/tutor_details_entity.dart';

class TutorDetailsModel extends TutorDetailsEntity {
  const TutorDetailsModel({
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    String? accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    double? rating,
    bool? isNative,
    String? youtubeVideoId,
    bool? isFavorite,
    double? avgRating,
    int? totalFeedback,
    UserModel? user,
  }) : super(
          accent: accent,
          bio: bio,
          education: education,
          experience: experience,
          profession: profession,
          targetStudent: targetStudent,
          interests: interests,
          languages: languages,
          specialties: specialties,
          rating: rating,
          isNative: isNative,
          youtubeVideoId: youtubeVideoId,
          isFavorite: isFavorite,
          avgRating: avgRating,
          totalFeedback: totalFeedback,
          user: user,
          video: video,
        );

  factory TutorDetailsModel.fromJson(Map<String, dynamic> json) {
    return TutorDetailsModel(
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      accent: json['accent'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      languages: json['languages'],
      specialties: json['specialties'],
      rating: json['rating'] != null
          ? double.parse(json['rating'].toString())
          : null,
      isNative: json['isNative'],
      youtubeVideoId: json['youtubeVideoId'],
      isFavorite: json['isFavorite'],
      avgRating: double.parse(json['avgRating'].toString()),
      totalFeedback: json['totalFeedback'],
      user: json['User'] != null ? UserModel.fromJson(json['User']) : null,
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    String? id,
    String? level,
    String? avatar,
    String? name,
    String? country,
    String? language,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    String? studentGroupId,
    List<CourseModel>? courses,
  }) : super(
          avatar: avatar,
          id: id,
          level: level,
          name: name,
          country: country,
          language: language,
          isPublicRecord: isPublicRecord,
          caredByStaffId: caredByStaffId,
          zaloUserId: zaloUserId,
          studentGroupId: studentGroupId,
          courses: courses,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      level: json['level'],
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      language: json['language'],
      isPublicRecord: json['isPublicRecord'],
      caredByStaffId: json['caredByStaffId'],
      zaloUserId: json['zaloUserId'],
      studentGroupId: json['studentGroupId'],
      courses: json['courses'] != null
          ? List<CourseModel>.from(
              json['courses'].map((x) => CourseModel.fromJson(x)))
          : null,
    );
  }
}

class CourseModel extends CourseEntity {
  const CourseModel({
    String? id,
    String? name,
    TutorCourseModel? tutorCourse,
  }) : super(id: id, name: name, tutorCourse: tutorCourse);

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
      tutorCourse: json['TutorCourse'] != null
          ? TutorCourseModel.fromJson(json['TutorCourse'])
          : null,
    );
  }
}

class TutorCourseModel extends TutorCourseEntity {
  const TutorCourseModel({
    String? userId,
    String? courseId,
    String? createdAt,
    String? updatedAt,
  }) : super(
            userId: userId,
            courseId: courseId,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory TutorCourseModel.fromJson(Map<String, dynamic> json) {
    return TutorCourseModel(
      userId: json['UserId'],
      courseId: json['CourseId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
