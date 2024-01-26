// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/domain/usecases/schedule/cancel_schedule.dart';
import 'package:let_tutor/domain/usecases/schedule/get_schedules.dart';
import 'package:let_tutor/injection_container.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetSchedulesUsecase _getSchedulesUsecase;
  final CancelScheduleUsecase _cancelScheduleUsecase;
  ScheduleBloc(
    this._getSchedulesUsecase,
    this._cancelScheduleUsecase,
  ) : super(ScheduleLoading(
          const [],
          ScheduleParams(
            page: 0,
            perPage: 0,
          ),
        )) {
    on<ScheduleFetched>(onScheduleFetched);
    on<ScheduleCancelled>(onCancelSchedule);
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

  void onCancelSchedule(
      ScheduleCancelled event, Emitter<ScheduleState> emit) async {
    final dataState = await _cancelScheduleUsecase(
      params: event.params,
    );

    if (dataState is DataSuccess) {
      Fluttertoast.showToast(
        msg: dataState.data ?? "Schedule has been cancelled successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      emit(ScheduleDone(
          state.schedules!
              .where((element) => element.id != event.params.scheduleDetailId)
              .toList(),
          state.params!));
    }

    if (dataState is DataFailed) {
      log(dataState.error?.message ??
          "Schedule has been cancelled successfully");
      Fluttertoast.showToast(
        msg: dataState.error?.message ??
            "Schedule has been cancelled successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }
  }
}
