import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_tutor_event.dart';
part 'home_tutor_state.dart';

class HomeTutorBloc extends Bloc<HomeTutorEvent, HomeTutorState> {
  final SearchTutorsUsecase _searchTutorsUsecase;
  final token = sl<SharedPreferences>().getString('access-token') ?? "";
  HomeTutorBloc(this._searchTutorsUsecase) : super(const TutorFetching()) {
    on<FetchTutor>(onFetch);
  }

  void onFetch(FetchTutor event, Emitter<HomeTutorState> emit) async {
    emit(const TutorFetching());

    final datastate = await _searchTutorsUsecase(
      params: SearchTutorsUsecaseParams(
        token: token,
        params: TutorSearchParams(
          page: 1,
          perPage: 5,
        ),
      ),
    );

    if (datastate is DataSuccess) {
      emit(TutorFetched(tutors: datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(TutorError(error: datastate.error!));
    }
  }
}
