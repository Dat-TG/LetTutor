import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';

class BookingScheduleUsecase
    implements UseCase<DataState<String>, BookingScheduleUsecaseParams> {
  final TutorScheduleRepository _tutorScheduleRepository;
  BookingScheduleUsecase(this._tutorScheduleRepository);

  @override
  Future<DataState<String>> call({BookingScheduleUsecaseParams? params}) {
    return _tutorScheduleRepository.bookingSchedule(
      token: params!.token,
      body: params.body,
    );
  }
}

class BookingScheduleUsecaseParams {
  final String token;
  final BookingScheduleBody body;

  BookingScheduleUsecaseParams({
    required this.token,
    required this.body,
  });
}
