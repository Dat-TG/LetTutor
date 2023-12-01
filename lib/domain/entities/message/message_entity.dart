import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String? id;
  final String? content;
  final bool? isRead;
  final DateTime? createdAt;
  final ReceiverInfoEntity? fromInfo;
  final ReceiverInfoEntity? toInfo;
  final ReceiverInfoEntity? partner;

  const MessageEntity({
    this.id,
    this.content,
    this.isRead,
    this.createdAt,
    this.fromInfo,
    this.toInfo,
    this.partner,
  });

  @override
  List<Object?> get props => [
        id,
        content,
        isRead,
        createdAt,
        fromInfo,
        toInfo,
        partner,
      ];
}

class ReceiverInfoEntity extends Equatable {
  final String? id;
  final String? name;
  final String? avatar;

  const ReceiverInfoEntity({this.id, this.name, this.avatar});

  @override
  List<Object?> get props => [id, name, avatar];
}
