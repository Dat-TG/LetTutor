import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';

class SearchTutorsUsecase
    implements UseCase<DataState<List<TutorEntity>>, TutorSearchParams> {
  final TutorRepository _tutorRepository;
  SearchTutorsUsecase(this._tutorRepository);

  @override
  Future<DataState<List<TutorEntity>>> call({TutorSearchParams? params}) {
    return _tutorRepository.getTutors(
      params: params!,
    );
  }
}
