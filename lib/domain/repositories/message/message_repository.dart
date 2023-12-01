import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';

abstract class MessageRepository {
  Future<DataState<List<MessageEntity>>> getReceivers({
    required String token,
  });
}
