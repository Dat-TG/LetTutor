import 'package:let_tutor/domain/entities/course/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    String? reason,
    String? purpose,
    String? otherDetails,
    int? defaultPrice,
    int? coursePrice,
    String? courseType,
    String? sectionType,
    bool? visible,
    int? displayOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<TopicEntity>? topics,
    List<CategoryEntity>? categories,
  }) : super(
          categories: categories,
          coursePrice: coursePrice,
          courseType: courseType,
          createdAt: createdAt,
          defaultPrice: defaultPrice,
          description: description,
          displayOrder: displayOrder,
          id: id,
          imageUrl: imageUrl,
          level: level,
          name: name,
          otherDetails: otherDetails,
          purpose: purpose,
          reason: reason,
          sectionType: sectionType,
          topics: topics,
          updatedAt: updatedAt,
          visible: visible,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      level: json['level'],
      reason: json['reason'],
      purpose: json['purpose'],
      otherDetails: json['otherDetails'],
      defaultPrice: json['defaultPrice'],
      coursePrice: json['coursePrice'],
      courseType: json['courseType'],
      sectionType: json['sectionType'],
      visible: json['visible'],
      displayOrder: json['displayOrder'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      topics: (json['topics'] as List<dynamic>)
          .map((topicJson) => TopicModel.fromJson(topicJson))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList(),
    );
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    String? id,
    String? title,
    String? description,
    String? key,
    int? displayOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          createdAt: createdAt,
          description: description,
          displayOrder: displayOrder,
          id: id,
          key: key,
          title: title,
          updatedAt: updatedAt,
        );
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      key: json['key'],
      displayOrder: json['displayOrder'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class TopicModel extends TopicEntity {
  const TopicModel({
    String? id,
    String? courseId,
    int? orderCourse,
    String? name,
    String? beforeTheClassNotes,
    String? afterTheClassNotes,
    String? nameFile,
    int? numberOfPages,
    String? description,
    String? videoUrl,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          afterTheClassNotes: afterTheClassNotes,
          beforeTheClassNotes: beforeTheClassNotes,
          courseId: courseId,
          createdAt: createdAt,
          description: description,
          id: id,
          name: name,
          nameFile: nameFile,
          numberOfPages: numberOfPages,
          orderCourse: orderCourse,
          type: type,
          updatedAt: updatedAt,
          videoUrl: videoUrl,
        );
  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'],
      courseId: json['courseId'],
      orderCourse: json['orderCourse'],
      name: json['name'],
      beforeTheClassNotes: json['beforeTheClassNotes'],
      afterTheClassNotes: json['afterTheClassNotes'],
      nameFile: json['nameFile'],
      numberOfPages: json['numberOfPages'],
      description: json['description'],
      videoUrl: json['videoUrl'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
