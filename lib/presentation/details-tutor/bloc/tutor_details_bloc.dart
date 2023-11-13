import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor_details/tutor_details_entity.dart';
import 'package:let_tutor/domain/usecases/tutor_details/get_tutor_details.dart';

part 'tutor_details_event.dart';
part 'tutor_details_state.dart';

class TutorDetailsBloc extends Bloc<TutorDetailsEvent, TutorDetailsState> {
  final GetTutorDetailsUsecase _getTutorDetailsUsecase;
  TutorDetailsBloc(this._getTutorDetailsUsecase)
      : super(const TutorDetailsLoading()) {
    on<TutorDetailsLoad>(onTutorLoad);
  }

  void onTutorLoad(
      TutorDetailsLoad event, Emitter<TutorDetailsState> emit) async {
    emit(const TutorDetailsLoading());
    final dataState = await _getTutorDetailsUsecase(
      params: GetTutorDetailsUsecaseParams(
        token: event.token,
        tutorId: event.tutorId,
      ),
    );
    if (dataState is DataSuccess) {
      emit(TutorDetailsDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(TutorDetailsError(dataState.error!));
    }
  }
}
