import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';

abstract class TutorScheduleRepository {
  Future<DataState<List<ScheduleOfTutorEntity>>> getScheduleOfTutor({
    required String token,
    required String tutorId,
    required int page,
  });

  Future<DataState<String>> bookingSchedule({
    required String token,
    required BookingScheduleBody body,
  });
}

class BookingScheduleBody {
  final List<String> scheduleDetailIds;
  final String note;

  BookingScheduleBody({
    required this.scheduleDetailIds,
    required this.note,
  });

  BookingScheduleBody copyWith({
    List<String>? scheduleDetailIds,
    String? note,
  }) {
    return BookingScheduleBody(
      scheduleDetailIds: scheduleDetailIds ?? this.scheduleDetailIds,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'scheduleDetailIds': scheduleDetailIds,
      'note': note,
    };
  }
}
