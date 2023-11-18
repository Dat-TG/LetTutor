import 'package:equatable/equatable.dart';

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
