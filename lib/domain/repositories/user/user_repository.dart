import 'dart:io';

import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> getUserInfo(String token);
  Future<DataState<UserEntity>> updateUserInfo(
    String token,
    UserInfoBody userInfoBody,
  );
  Future<DataState<UserEntity>> uploadAvatar(
    String token,
    File image,
  );
}

class UserInfoBody {
  final String name;
  final String country;
  final String phone;
  final String birthday;
  final String level;
  final List<String> learnTopics;
  final String studySchedule;
  final List<String> testPreparations;

  UserInfoBody({
    required this.birthday,
    required this.country,
    required this.learnTopics,
    required this.level,
    required this.name,
    required this.phone,
    required this.studySchedule,
    required this.testPreparations,
  });

  UserInfoBody copyWith({
    String? birthday,
    String? country,
    List<String>? learnTopics,
    String? level,
    String? name,
    String? phone,
    String? studySchedule,
    List<String>? testPreparations,
  }) {
    return UserInfoBody(
      birthday: birthday ?? this.birthday,
      country: country ?? this.country,
      learnTopics: learnTopics ?? this.learnTopics,
      level: level ?? this.level,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      studySchedule: studySchedule ?? this.studySchedule,
      testPreparations: testPreparations ?? this.testPreparations,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'birthday': birthday,
      'country': country,
      'learnTopics': learnTopics,
      'level': level,
      'name': name,
      'phone': phone,
      'studySchedule': studySchedule,
      'testPreparations': testPreparations,
    };
  }
}
