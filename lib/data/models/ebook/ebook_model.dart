import 'package:let_tutor/domain/entities/ebook/ebook_entity.dart';

class EbookModel extends EbookEntity {
  const EbookModel({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    String? fileUrl,
  }) : super(
          description: description,
          fileUrl: fileUrl,
          id: id,
          imageUrl: imageUrl,
          level: level,
          name: name,
        );
  factory EbookModel.fromJson(Map<String, dynamic> json) {
    return EbookModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      level: json['level'],
      fileUrl: json['fileUrl'],
    );
  }
}
