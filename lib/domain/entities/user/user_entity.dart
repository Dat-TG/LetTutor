import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  final String? language;
  final String? birthday;
  final bool? isActivated;
  final TutorInfoEntity? tutorInfo;
  final WalletInfoEntity? walletInfo;
  final String? requireNote;
  final String? level;
  final List<LearnTopicEntity>? learnTopics;
  final List<LearnTopicEntity>? testPreparations;
  final bool? isPhoneActivated;
  final int? timezone;
  final ReferralInfoEntity? referralInfo;
  final String? studySchedule;
  final bool? canSendMessage;
  final String? studentGroup;
  final StudentInfoEntity? studentInfo;
  final double? avgRating;

  const UserEntity({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.studySchedule,
    this.canSendMessage,
    this.studentGroup,
    this.studentInfo,
    this.avgRating,
  });

  UserEntity copyWith({
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
    TutorInfoEntity? tutorInfo,
    WalletInfoEntity? walletInfo,
    String? requireNote,
    String? level,
    List<LearnTopicEntity>? learnTopics,
    List<LearnTopicEntity>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    ReferralInfoEntity? referralInfo,
    String? studySchedule,
    bool? canSendMessage,
    String? studentGroup,
    StudentInfoEntity? studentInfo,
    double? avgRating,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      isActivated: isActivated ?? this.isActivated,
      tutorInfo: tutorInfo ?? this.tutorInfo,
      walletInfo: walletInfo ?? this.walletInfo,
      requireNote: requireNote ?? this.requireNote,
      level: level ?? this.level,
      learnTopics: learnTopics ?? this.learnTopics,
      testPreparations: testPreparations ?? this.testPreparations,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      timezone: timezone ?? this.timezone,
      referralInfo: referralInfo ?? this.referralInfo,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      studentGroup: studentGroup ?? this.studentGroup,
      studentInfo: studentInfo ?? this.studentInfo,
      avgRating: avgRating ?? this.avgRating,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      email,
      name,
      avatar,
      country,
      phone,
      roles,
      language,
      birthday,
      isActivated,
      tutorInfo,
      walletInfo,
      requireNote,
      level,
      learnTopics,
      testPreparations,
      isPhoneActivated,
      timezone,
      referralInfo,
      studySchedule,
      canSendMessage,
      studentGroup,
      studentInfo,
      avgRating,
    ];
  }

  Map<String, dynamic>? toJson() {
    return {};
  }
}

class TutorInfoEntity extends Equatable {
  final String? id;
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
  final String? resume;
  final double? rating;
  final bool? isActivated;
  final bool? isNative;
  final String? youtubeVideoId;
  const TutorInfoEntity({
    this.id,
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
    this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
    this.youtubeVideoId,
  });

  @override
  List<Object?> get props {
    return [
      id,
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
      resume,
      rating,
      isActivated,
      isNative,
      youtubeVideoId,
    ];
  }

  Map<String, dynamic>? toJson() {
    return {};
  }
}

class WalletInfoEntity extends Equatable {
  final String? amount;
  final bool? isBlocked;
  final int? bonus;

  const WalletInfoEntity({
    this.amount,
    this.isBlocked,
    this.bonus,
  });

  @override
  List<Object?> get props => [amount, isBlocked, bonus];
  Map<String, dynamic>? toJson() {
    return {};
  }
}

class LearnTopicEntity extends Equatable {
  final int? id;
  final String? key;
  final String? name;

  const LearnTopicEntity({
    this.id,
    this.key,
    this.name,
  });

  @override
  List<Object?> get props => [id, key, name];
  Map<String, dynamic>? toJson() {
    return {};
  }
}

class ReferralInfoEntity extends Equatable {
  final String? referralCode;
  final ReferralPackInfoEntity? referralPackInfo;

  const ReferralInfoEntity({
    this.referralCode,
    this.referralPackInfo,
  });

  @override
  List<Object?> get props => [referralCode, referralPackInfo];
  Map<String, dynamic>? toJson() {
    return {};
  }
}

class ReferralPackInfoEntity extends Equatable {
  final int? earnPercent;

  const ReferralPackInfoEntity({
    this.earnPercent,
  });

  @override
  List<Object?> get props => [earnPercent];

  Map<String, dynamic>? toJson() {
    return {};
  }
}

class StudentInfoEntity {
  Map<String, dynamic>? toJson() {
    return {};
  }
}
