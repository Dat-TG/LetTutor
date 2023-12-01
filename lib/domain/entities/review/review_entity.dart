import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final double? rating;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FirstInfoEntity? firstInfo;

  const ReviewEntity({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  @override
  List<Object?> get props => [
        id,
        bookingId,
        firstId,
        secondId,
        rating,
        content,
        createdAt,
        updatedAt,
        firstInfo,
      ];
}

class FirstInfoEntity extends Equatable {
  final String? name;
  final String? avatar;

  const FirstInfoEntity({this.name, this.avatar});

  @override
  List<Object?> get props => [name, avatar];
}
