import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';

class FavoriteTutorUsecase
    implements UseCase<DataState<bool>, FavoriteTutorUsecaseParams> {
  final TutorRepository _tutorRepository;
  FavoriteTutorUsecase(this._tutorRepository);

  @override
  Future<DataState<bool>> call({FavoriteTutorUsecaseParams? params}) {
    return _tutorRepository.favoriteTutor(
      token: params!.token,
      tutorId: params.tutorId,
    );
  }
}

class FavoriteTutorUsecaseParams {
  final String token;
  final String tutorId;

  FavoriteTutorUsecaseParams({
    required this.token,
    required this.tutorId,
  });
}
