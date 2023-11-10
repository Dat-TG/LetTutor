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
  TutorBloc(this._searchTutorsUsecase) : super(const TutorSearchInProgress()) {
    on<TutorSearch>(onSearch);
  }

  void onSearch(TutorSearch event, Emitter<TutorState> emit) async {
    emit(const TutorSearchInProgress());
    final dataState = await _searchTutorsUsecase(params: event.params);

    if (dataState is DataSuccess) {
      emit(TutorSearchSuccess([...?state.tutors, ...?dataState.data]));
    }

    if (dataState is DataFailed) {
      emit(TutorSearchFailure(dataState.error!));
    }
  }
}
