import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';

abstract class TutorScheduleRepository {
  Future<DataState<List<ScheduleOfTutorEntity>>> getScheduleOfTutor({
    required String token,
    required String tutorId,
    required int page,
  });
}
