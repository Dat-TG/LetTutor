import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> getUser();
}
