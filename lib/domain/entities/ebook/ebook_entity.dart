import 'package:equatable/equatable.dart';

class EbookEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? fileUrl;
  const EbookEntity({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.fileUrl,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        level,
        fileUrl,
      ];
}
