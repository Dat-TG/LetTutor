import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';

part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  final SearchTutorsUsecase _searchTutorsUsecase;
  TutorBloc(this._searchTutorsUsecase)
      : super(const TutorSearchInProgress([], 0)) {
    on<TutorSearching>(onSearch);
  }

  void onSearch(TutorSearching event, Emitter<TutorState> emit) async {
    emit(TutorSearchInProgress(state.tutors ?? [], state.page ?? 0));
    final dataState = await _searchTutorsUsecase(params: event.params);
    print(
        'fetch data page ${event.params.params.page} perPage ${event.params.params.perPage}');
    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        emit(TutorSearchSuccess(
            [...(state.tutors ?? []), ...(dataState.data ?? [])],
            event.params.params.page ?? 1));
      } else {
        emit(TutorNotFound(state.tutors ?? [], state.page ?? 0));
      }
    }

    if (dataState is DataFailed) {
      emit(TutorSearchFailure(dataState.error!));
    }
  }
}
