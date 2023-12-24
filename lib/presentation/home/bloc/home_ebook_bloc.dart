import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/ebook/ebook_entity.dart';
import 'package:let_tutor/domain/usecases/ebook/get_list_ebooks.dart';

part 'home_ebook_event.dart';
part 'home_ebook_state.dart';

class HomeEbookBloc extends Bloc<HomeEbookEvent, HomeEbookState> {
  final GetListEbooksUsecase _getListEbooksUsecase;
  HomeEbookBloc(this._getListEbooksUsecase) : super(const EbookFetching()) {
    on<FetchEbook>(onFetch);
  }

  void onFetch(FetchEbook event, Emitter<HomeEbookState> emit) async {
    emit(const EbookFetching());

    final datastate = await _getListEbooksUsecase(
      params: GetListEbooksUsecaseParams(
        page: 1,
        size: 5,
      ),
    );

    if (datastate is DataSuccess) {
      emit(EbookFetched(ebooks: datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(EbookError(error: datastate.error!));
    }
  }
}
