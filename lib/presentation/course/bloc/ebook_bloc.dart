import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/ebook/ebook_entity.dart';
import 'package:let_tutor/domain/usecases/ebook/get_list_ebooks.dart';

part 'ebook_event.dart';
part 'ebook_state.dart';

class EbookBloc extends Bloc<EbookEvent, EbookState> {
  final GetListEbooksUsecase _getListEbooksUsecase;
  EbookBloc(this._getListEbooksUsecase) : super(const EbookLoading()) {
    on<EbookFetching>(onSearch);
  }

  void onSearch(EbookFetching event, Emitter<EbookState> emit) async {
    emit(EbookLoading(
      ebooks: state.ebooks,
      params: event.params.copyWith(page: state.params?.page ?? 0),
      error: state.error,
    ));
    final dataState = await _getListEbooksUsecase(params: event.params);
    print('page ${event.params.page}  ${dataState.data?.length}');
    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if ((event.params.page) > (state.params?.page ?? 0)) {
          emit(EbookDone(
            ebooks: [...(state.ebooks ?? []), ...(dataState.data ?? [])],
            params: event.params,
            error: state.error,
          ));
        } else {
          emit(EbookDone(
            ebooks: dataState.data ?? [],
            params: event.params,
            error: state.error,
          ));
        }
      } else {
        if (event.params.page == 1 || state.ebooks!.isEmpty) {
          emit(EbookNotFound(
            ebooks: state.ebooks ?? [],
            params: event.params,
            error: state.error,
          ));
        } else {
          emit(EbookCompleted(
            ebooks: state.ebooks ?? [],
            params: event.params,
            error: state.error,
          ));
        }
      }
    }

    if (dataState is DataFailed) {
      emit(EbookFailed(
        ebooks: state.ebooks ?? [],
        params: event.params,
        error: dataState.error,
      ));
    }
  }
}
