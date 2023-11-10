import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';

class TutorModel extends TutorEntity {
  const TutorModel({
    final String? avatar,
    final String? country,
    final String? id,
    final String? name,
    final String? bio,
    final bool? isNative,
    final String? specialties,
    final double? rating,
    final String? userId,
    final List<String>? schedulesTimes,
    final bool? isFavoriteTutor,
    final int? price,
  }) : super(
          avatar: avatar,
          country: country,
          id: id,
          name: name,
          bio: bio,
          isNative: isNative,
          specialties: specialties,
          rating: rating,
          userId: userId,
          schedulesTimes: schedulesTimes,
          isFavoriteTutor: isFavoriteTutor,
          price: price,
        );

  factory TutorModel.fromJson(Map<String, dynamic> json) {
    return TutorModel(
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      isNative: json['isNative'] as bool?,
      specialties: json['specialties'] as String?,
      rating: json['rating'] as double?,
      userId: json['userId'] as String?,
      schedulesTimes: (json['schedulesTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isFavoriteTutor: json['isFavoriteTutor'] as bool?,
      price: json['price'] as int?,
    );
  }
}
