import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/review/review_entity.dart';
import 'package:let_tutor/domain/repositories/review/review_repository.dart';
import 'package:let_tutor/domain/usecases/review/get_reviews.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final GetReviewsUsecase _getReviewsUsecase;
  ReviewBloc(this._getReviewsUsecase)
      : super(ReviewsLoading(
            const [],
            GetReviewsUsecaseParams(
                token: '',
                params: ReviewParams(page: 1, perPage: 10, tutorId: '')))) {
    on<ReviewFetched>(onReviewsFetched);
  }

  void onReviewsFetched(ReviewFetched event, Emitter<ReviewState> emit) async {
    emit(ReviewsLoading(
      state.reviews ?? [],
      event.params,
    ));

    final dataState = await _getReviewsUsecase(
      params: event.params,
    );

    print('Fetch reviews: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if (event.params.params.page == 1) {
          emit(ReviewsDone(dataState.data ?? [], event.params));
        } else {
          emit(ReviewsDone(
            [...(state.reviews ?? []), ...(dataState.data ?? [])],
            event.params,
          ));
        }
      } else {
        emit(ReviewsComplete(
          state.reviews ?? [],
          event.params,
        ));
      }
    }

    if (dataState is DataFailed) {
      emit(ReviewFailed(dataState.error!));
    }
  }
}
