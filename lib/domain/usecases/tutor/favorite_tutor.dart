import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';

class FavoriteTutorUsecase implements UseCase<DataState<bool>, String> {
  final TutorRepository _tutorRepository;
  FavoriteTutorUsecase(this._tutorRepository);

  @override
  Future<DataState<bool>> call({String? params}) {
    return _tutorRepository.favoriteTutor(
      tutorId: params!,
    );
  }
}
