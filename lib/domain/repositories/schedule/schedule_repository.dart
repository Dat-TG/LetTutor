import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<DataState<List<ScheduleEntity>>> getSchedules({
    required ScheduleParams params,
  });

  Future<DataState<List<ScheduleEntity>>> getHistory({
    required ScheduleParams params,
  });

  Future<DataState<String>> cancelSchedule({
    required String scheduleDetailId,
    required int cancelReasonId,
    String note = "",
  });
}

class CancelScheduleParams {
  final String scheduleDetailId;
  final int cancelReasonId;
  final String note;

  CancelScheduleParams({
    required this.scheduleDetailId,
    required this.cancelReasonId,
    required this.note,
  });

  CancelScheduleParams copyWith({
    String? scheduleDetailId,
    int? cancelReasonId,
    String? note,
  }) {
    return CancelScheduleParams(
      scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
      cancelReasonId: cancelReasonId ?? this.cancelReasonId,
      note: note ?? this.note,
    );
  }
}

class ScheduleParams {
  final int? page;
  final int? perPage;

  ScheduleParams({
    this.page,
    this.perPage,
  });

  ScheduleParams copyWith({
    int? page,
    int? perPage,
  }) {
    return ScheduleParams(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}
