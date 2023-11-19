import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? reason;
  final String? purpose;
  final String? otherDetails;
  final int? defaultPrice;
  final int? coursePrice;
  final String? courseType;
  final String? sectionType;
  final bool? visible;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<TopicEntity>? topics;
  final List<CategoryEntity>? categories;

  const CourseEntity({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.courseType,
    this.sectionType,
    this.visible,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.categories,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        level,
        reason,
        purpose,
        otherDetails,
        defaultPrice,
        coursePrice,
        courseType,
        sectionType,
        visible,
        displayOrder,
        createdAt,
        updatedAt,
        topics,
        categories,
      ];
}

class CategoryEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? key;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryEntity({
    this.id,
    this.title,
    this.description,
    this.key,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        key,
        displayOrder,
        createdAt,
        updatedAt,
      ];
}

class TopicEntity extends Equatable {
  final String? id;
  final String? courseId;
  final int? orderCourse;
  final String? name;
  final String? beforeTheClassNotes;
  final String? afterTheClassNotes;
  final String? nameFile;
  final int? numberOfPages;
  final String? description;
  final String? videoUrl;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TopicEntity({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.beforeTheClassNotes,
    this.afterTheClassNotes,
    this.nameFile,
    this.numberOfPages,
    this.description,
    this.videoUrl,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        courseId,
        orderCourse,
        name,
        beforeTheClassNotes,
        afterTheClassNotes,
        nameFile,
        numberOfPages,
        description,
        videoUrl,
        type,
        createdAt,
        updatedAt,
      ];
}
