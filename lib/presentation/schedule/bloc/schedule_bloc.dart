import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/domain/usecases/schedule/get_schedules.dart';
import 'package:let_tutor/injection_container.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetSchedulesUsecase _getSchedulesUsecase;
  ScheduleBloc(this._getSchedulesUsecase)
      : super(ScheduleLoading(
          const [],
          ScheduleParams(
            page: 0,
            perPage: 0,
          ),
        )) {
    on<ScheduleFetched>(onScheduleFetched);
  }

  void onScheduleFetched(
      ScheduleFetched event, Emitter<ScheduleState> emit) async {
    emit(ScheduleLoading(
      state.schedules ?? [],
      event.params,
    ));

    final dataState = await _getSchedulesUsecase(
      params: event.params,
    );

    print('baseURL: ${sl<Dio>().options.headers}');
    print('Fetch schedule: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if (event.params.page == 1) {
          if (dataState.data?.length == event.params.perPage) {
            emit(ScheduleDone(dataState.data ?? [], event.params));
          } else {
            emit(ScheduleComplete(dataState.data ?? [], event.params));
          }
        } else {
          if (dataState.data?.length == event.params.perPage) {
            emit(ScheduleDone(
              [...(state.schedules ?? []), ...(dataState.data ?? [])],
              event.params,
            ));
          } else {
            emit(ScheduleComplete(
              [...(state.schedules ?? []), ...(dataState.data ?? [])],
              event.params,
            ));
          }
        }
      } else {
        emit(ScheduleComplete(
          state.schedules ?? [],
          event.params,
        ));
      }
    }

    if (dataState is DataFailed) {
      emit(ScheduleFailed(
          state.schedules ?? [], event.params, dataState.error!));
    }
  }
}
