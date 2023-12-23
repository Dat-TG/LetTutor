import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/tutor_details/tutor_details_repository.dart';

class ReportTutorUsecase
    implements UseCase<DataState<String>, ReportTutorUsecaseParams> {
  final TutorDetailsRepository _tutorDetailsRepository;
  ReportTutorUsecase(this._tutorDetailsRepository);

  @override
  Future<DataState<String>> call({ReportTutorUsecaseParams? params}) {
    return _tutorDetailsRepository.reportTutor(
      tutorId: params!.tutorId,
      content: params.content,
    );
  }
}

class ReportTutorUsecaseParams {
  final String tutorId;
  final String content;

  ReportTutorUsecaseParams({required this.tutorId, required this.content});
}
