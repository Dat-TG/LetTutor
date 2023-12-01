import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/usecases/schedule/get_history.dart';
import 'package:let_tutor/domain/usecases/schedule/get_schedules.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistoryUsecase _getHistoryUsecase;
  HistoryBloc(this._getHistoryUsecase)
      : super(HistoryLoading(const [],
            GetSchedulesUsecaseParams(page: 0, perPage: 0, token: ""))) {
    on<HistoryFetched>(onHistoryFetched);
  }

  void onHistoryFetched(
      HistoryFetched event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading(
      state.history ?? [],
      event.params,
    ));

    final dataState = await _getHistoryUsecase(
      params: event.params,
    );

    print('Fetch history: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if (event.params.page == 1) {
          emit(HistoryDone(dataState.data ?? [], event.params));
        } else {
          emit(HistoryDone(
            [...(state.history ?? []), ...(dataState.data ?? [])],
            event.params,
          ));
        }
      } else {
        emit(HistoryComplete(
          state.history ?? [],
          event.params,
        ));
      }
    }

    if (dataState is DataFailed) {
      emit(HistoryFailed(state.history ?? [], event.params, dataState.error!));
    }
  }
}
