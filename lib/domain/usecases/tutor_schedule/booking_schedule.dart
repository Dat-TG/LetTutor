import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';

class BookingScheduleUsecase
    implements UseCase<DataState<String>, BookingScheduleBody> {
  final TutorScheduleRepository _tutorScheduleRepository;
  BookingScheduleUsecase(this._tutorScheduleRepository);

  @override
  Future<DataState<String>> call({BookingScheduleBody? params}) {
    return _tutorScheduleRepository.bookingSchedule(
      body: params!,
    );
  }
}
