import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/domain/repositories/message/message_repository.dart';

class GetReceiversUsecase
    implements UseCase<DataState<List<MessageEntity>>, String> {
  final MessageRepository _messageRepository;
  GetReceiversUsecase(this._messageRepository);

  @override
  Future<DataState<List<MessageEntity>>> call({String? params}) {
    return _messageRepository.getReceivers(
      token: params!,
    );
  }
}
