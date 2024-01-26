import 'package:let_tutor/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    String? language,
    String? birthday,
    bool? isActivated,
    TutorInfo? tutorInfo,
    WalletInfo? walletInfo,
    String? requireNote,
    String? level,
    List<LearnTopic>? learnTopics,
    List<LearnTopic>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    ReferralInfo? referralInfo,
    String? studySchedule,
    bool? canSendMessage,
    String? studentGroup,
    StudentInfo? studentInfo,
    double? avgRating,
  }) : super(
          avatar: avatar,
          avgRating: avgRating,
          birthday: birthday,
          canSendMessage: canSendMessage,
          country: country,
          email: email,
          id: id,
          isActivated: isActivated,
          isPhoneActivated: isPhoneActivated,
          language: language,
          learnTopics: learnTopics,
          level: level,
          name: name,
          phone: phone,
          referralInfo: referralInfo,
          requireNote: requireNote,
          roles: roles,
          studentGroup: studentGroup,
          studentInfo: studentInfo,
          studySchedule: studySchedule,
          testPreparations: testPreparations,
          timezone: timezone,
          tutorInfo: tutorInfo,
          walletInfo: walletInfo,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      country: json['country'],
      phone: json['phone'],
      roles: List<String>.from(json['roles'] ?? {}),
      language: json['language'],
      birthday: json['birthday'],
      isActivated: json['isActivated'],
      tutorInfo: TutorInfo.fromJson(json['tutorInfo'] ?? {}),
      walletInfo: WalletInfo.fromJson(json['walletInfo'] ?? {}),
      requireNote: json['requireNote'],
      level: json['level'],
      learnTopics: json['learnTopics'] != null
          ? List<LearnTopic>.from(
              json['learnTopics'].map((x) => LearnTopic.fromJson(x ?? {})))
          : [],
      testPreparations: json['testPreparations'] != null
          ? List<LearnTopic>.from(
              json['testPreparations'].map((x) => LearnTopic.fromJson(x ?? {})))
          : [],
      isPhoneActivated: json['isPhoneActivated'],
      timezone: json['timezone'],
      referralInfo: ReferralInfo.fromJson(json['referralInfo'] ?? {}),
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      studentGroup: json['studentGroup'],
      studentInfo: StudentInfo.fromJson(json['studentInfo'] ?? {}),
      avgRating: json['avgRating'] != null
          ? double.parse(json['avgRating'].toString())
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'country': country,
      'phone': phone,
      'roles': roles,
      'language': language,
      'birthday': birthday,
      'isActivated': isActivated,
      'tutorInfo': tutorInfo?.toJson(),
      'walletInfo': walletInfo?.toJson(),
      'requireNote': requireNote,
      'level': level,
      'learnTopics': learnTopics?.map((x) => x.toJson()).toList(),
      'testPreparations': testPreparations?.map((x) => x.toJson()).toList(),
      'isPhoneActivated': isPhoneActivated,
      'timezone': timezone,
      'referralInfo': referralInfo?.toJson(),
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'studentGroup': studentGroup,
      'studentInfo': studentInfo?.toJson(),
      'avgRating': avgRating,
    };
  }
}

class TutorInfo extends TutorInfoEntity {
  const TutorInfo({
    String? id,
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
    String? resume,
    double? rating,
    bool? isActivated,
    bool? isNative,
    String? youtubeVideoId,
  }) : super(
          accent: accent,
          bio: bio,
          education: education,
          experience: experience,
          id: id,
          interests: interests,
          isActivated: isActivated,
          isNative: isNative,
          languages: languages,
          profession: profession,
          rating: rating,
          resume: resume,
          specialties: specialties,
          targetStudent: targetStudent,
          video: video,
          youtubeVideoId: youtubeVideoId,
        );

  factory TutorInfo.fromJson(Map<String, dynamic> json) {
    return TutorInfo(
      id: json['id'],
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
      resume: json['resume'],
      rating: json['rating'],
      isActivated: json['isActivated'],
      isNative: json['isNative'],
      youtubeVideoId: json['youtubeVideoId'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'video': video,
      'bio': bio,
      'education': education,
      'experience': experience,
      'profession': profession,
      'accent': accent,
      'targetStudent': targetStudent,
      'interests': interests,
      'languages': languages,
      'specialties': specialties,
      'resume': resume,
      'rating': rating,
      'isActivated': isActivated,
      'isNative': isNative,
      'youtubeVideoId': youtubeVideoId,
    };
  }
}

class WalletInfo extends WalletInfoEntity {
  const WalletInfo({
    String? amount,
    bool? isBlocked,
    int? bonus,
  }) : super(
          amount: amount,
          bonus: bonus,
          isBlocked: isBlocked,
        );

  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      amount: json['amount'],
      isBlocked: json['isBlocked'],
      bonus: json['bonus'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'isBlocked': isBlocked,
      'bonus': bonus,
    };
  }
}

class LearnTopic extends LearnTopicEntity {
  const LearnTopic({int? id, String? key, String? name})
      : super(
          id: id,
          key: key,
          name: name,
        );

  factory LearnTopic.fromJson(Map<String, dynamic> json) {
    return LearnTopic(
      id: json['id'],
      key: json['key'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'name': name,
    };
  }
}

class ReferralInfo extends ReferralInfoEntity {
  const ReferralInfo({
    String? referralCode,
    ReferralPackInfo? referralPackInfo,
  }) : super(
          referralCode: referralCode,
          referralPackInfo: referralPackInfo,
        );

  factory ReferralInfo.fromJson(Map<String, dynamic> json) {
    return ReferralInfo(
      referralCode: json['referralCode'],
      referralPackInfo:
          ReferralPackInfo.fromJson(json['referralPackInfo'] ?? {}),
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'referralCode': referralCode,
      'referralPackInfo': referralPackInfo?.toJson(),
    };
  }
}

class ReferralPackInfo extends ReferralPackInfoEntity {
  const ReferralPackInfo({
    int? earnPercent,
  }) : super(
          earnPercent: earnPercent,
        );

  factory ReferralPackInfo.fromJson(Map<String, dynamic> json) {
    return ReferralPackInfo(
      earnPercent: json['earnPercent'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'earnPercent': earnPercent,
    };
  }
}

class StudentInfo extends StudentInfoEntity {
  StudentInfo() : super();
  factory StudentInfo.fromJson(Map<String, dynamic> json) {
    return StudentInfo();
  }
  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}
