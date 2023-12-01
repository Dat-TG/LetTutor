import 'package:let_tutor/domain/entities/message/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    String? id,
    String? content,
    bool? isRead,
    DateTime? createdAt,
    ReceiverInfoEntity? fromInfo,
    ReceiverInfoEntity? toInfo,
    ReceiverInfoEntity? partner,
  }) : super(
          id: id,
          content: content,
          isRead: isRead,
          createdAt: createdAt,
          fromInfo: fromInfo,
          toInfo: toInfo,
          partner: partner,
        );
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String?,
      content: json['content'] as String?,
      isRead: json['isRead'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      fromInfo: json['fromInfo'] != null
          ? ReceiverInfoModel.fromJson(json['fromInfo'] as Map<String, dynamic>)
          : null,
      toInfo: json['toInfo'] != null
          ? ReceiverInfoModel.fromJson(json['toInfo'] as Map<String, dynamic>)
          : null,
      partner: json['partner'] != null
          ? ReceiverInfoModel.fromJson(json['partner'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ReceiverInfoModel extends ReceiverInfoEntity {
  const ReceiverInfoModel({
    String? id,
    String? name,
    String? avatar,
  }) : super(id: id, name: name, avatar: avatar);

  factory ReceiverInfoModel.fromJson(Map<String, dynamic> json) {
    return ReceiverInfoModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }
}
