import 'package:let_tutor/domain/entities/review/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    double? rating,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    FirstInfoModel? firstInfo,
  }) : super(
          bookingId: bookingId,
          content: content,
          createdAt: createdAt,
          firstId: firstId,
          firstInfo: firstInfo,
          id: id,
          rating: rating,
          secondId: secondId,
          updatedAt: updatedAt,
        );
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String?,
      bookingId: json['bookingId'] as String?,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      rating: double.parse(json['rating'].toString()),
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      firstInfo: json['firstInfo'] == null
          ? null
          : FirstInfoModel.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );
  }
}

class FirstInfoModel extends FirstInfoEntity {
  const FirstInfoModel({
    String? name,
    String? avatar,
  }) : super(avatar: avatar, name: name);
  factory FirstInfoModel.fromJson(Map<String, dynamic> json) {
    return FirstInfoModel(
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }
}
