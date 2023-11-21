import 'package:equatable/equatable.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';

class TutorEntity extends Equatable {
  final String? avatar;
  final String? country;
  final String? id;
  final String? name;
  final String? bio;
  final bool? isNative;
  final String? specialties;
  final double? rating;
  final String? userId;
  final int? schedulesTimes;
  final bool? isFavoriteTutor;
  final int? price;

  const TutorEntity({
    this.avatar,
    this.country,
    this.id,
    this.name,
    this.bio,
    this.isNative,
    this.specialties,
    this.rating,
    this.userId,
    this.schedulesTimes,
    this.isFavoriteTutor,
    this.price,
  });

  TutorEntity copyWith({
    String? avatar,
    String? country,
    String? id,
    String? name,
    String? bio,
    bool? isNative,
    String? specialties,
    double? rating,
    String? userId,
    int? schedulesTimes,
    bool? isFavoriteTutor,
    int? price,
  }) {
    return TutorModel(
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      id: id ?? this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      isNative: isNative ?? this.isNative,
      specialties: specialties ?? this.specialties,
      rating: rating ?? this.rating,
      userId: userId ?? this.userId,
      schedulesTimes: schedulesTimes ?? this.schedulesTimes,
      isFavoriteTutor: isFavoriteTutor ?? this.isFavoriteTutor,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props {
    return [
      avatar,
      country,
      id,
      name,
      bio,
      isNative,
      specialties,
      rating,
      userId,
      schedulesTimes,
      isFavoriteTutor,
      price,
    ];
  }
}
