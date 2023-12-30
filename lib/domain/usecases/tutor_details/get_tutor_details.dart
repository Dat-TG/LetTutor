import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/tutor_details/tutor_details_entity.dart';
import 'package:let_tutor/domain/repositories/tutor_details/tutor_details_repository.dart';

class GetTutorDetailsUsecase
    implements UseCase<DataState<TutorDetailsEntity>, String> {
  final TutorDetailsRepository _tutorDetailsRepository;
  GetTutorDetailsUsecase(this._tutorDetailsRepository);

  @override
  Future<DataState<TutorDetailsEntity>> call({String? params}) {
    return _tutorDetailsRepository.getTutorDetails(
      id: params!,
    );
  }
}
