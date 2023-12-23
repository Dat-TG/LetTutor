import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';

class GetScheduleOfTutorUsecase
    implements
        UseCase<DataState<List<ScheduleOfTutorEntity>>,
            GetScheduleOfTutorUsecaseParams> {
  final TutorScheduleRepository _tutorScheduleRepository;
  GetScheduleOfTutorUsecase(this._tutorScheduleRepository);

  @override
  Future<DataState<List<ScheduleOfTutorEntity>>> call(
      {GetScheduleOfTutorUsecaseParams? params}) {
    return _tutorScheduleRepository.getScheduleOfTutor(
        tutorId: params!.tutorId, page: params.page);
  }
}

class GetScheduleOfTutorUsecaseParams {
  final String tutorId;
  final int page;

  GetScheduleOfTutorUsecaseParams({
    required this.page,
    required this.tutorId,
  });

  GetScheduleOfTutorUsecaseParams copyWith({
    int? page,
    String? tutorId,
  }) {
    return GetScheduleOfTutorUsecaseParams(
      page: page ?? this.page,
      tutorId: tutorId ?? this.tutorId,
    );
  }
}
