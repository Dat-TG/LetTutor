import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';

abstract class MessageRepository {
  Future<DataState<List<MessageEntity>>> getReceivers();
  Future<DataState<List<MessageEntity>>> getMessagesByUserId({
    required String userId,
    required int startTime,
    required int page,
    required int perPage,
  });
}
