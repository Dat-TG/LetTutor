import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/tutor_details/tutor_details_entity.dart';
import 'package:let_tutor/domain/repositories/tutor_details/tutor_details_repository.dart';

class GetTutorDetailsUsecase
    implements
        UseCase<DataState<TutorDetailsEntity>, GetTutorDetailsUsecaseParams> {
  final TutorDetailsRepository _tutorDetailsRepository;
  GetTutorDetailsUsecase(this._tutorDetailsRepository);

  @override
  Future<DataState<TutorDetailsEntity>> call(
      {GetTutorDetailsUsecaseParams? params}) {
    return _tutorDetailsRepository.getTutorDetails(
      token: params!.token,
      id: params.tutorId,
    );
  }
}

class GetTutorDetailsUsecaseParams {
  final String tutorId;
  final String token;

  GetTutorDetailsUsecaseParams({required this.tutorId, required this.token});
}
