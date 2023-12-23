import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/domain/repositories/message/message_repository.dart';

class GetMessagesByUserIdUsecase
    implements
        UseCase<DataState<List<MessageEntity>>,
            GetMessagesByUserIdUsecaseParams> {
  final MessageRepository _messageRepository;
  GetMessagesByUserIdUsecase(this._messageRepository);

  @override
  Future<DataState<List<MessageEntity>>> call(
      {GetMessagesByUserIdUsecaseParams? params}) {
    return _messageRepository.getMessagesByUserId(
      userId: params!.userId,
      startTime: params.startTime,
      page: params.page,
      perPage: params.perPage,
    );
  }
}

class GetMessagesByUserIdUsecaseParams {
  final String userId;
  final int startTime;
  final int page;
  final int perPage;

  GetMessagesByUserIdUsecaseParams({
    required this.page,
    required this.perPage,
    required this.startTime,
    required this.userId,
  });

  GetMessagesByUserIdUsecaseParams copyWith({
    String? token,
    String? userId,
    int? startTime,
    int? page,
    int? perPage,
  }) {
    return GetMessagesByUserIdUsecaseParams(
      userId: userId ?? this.userId,
      startTime: startTime ?? this.startTime,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}
