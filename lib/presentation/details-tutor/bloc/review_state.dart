part of 'review_bloc.dart';

sealed class ReviewState extends Equatable {
  final List<ReviewEntity>? reviews;
  final DioException? error;
  final GetReviewsUsecaseParams? params;
  const ReviewState({
    this.reviews,
    this.error,
    this.params,
  });

  @override
  List<Object?> get props => [reviews, error];
}

final class ReviewsLoading extends ReviewState {
  const ReviewsLoading(
      List<ReviewEntity> reviews, GetReviewsUsecaseParams params)
      : super(reviews: reviews, params: params);
}

final class ReviewsDone extends ReviewState {
  const ReviewsDone(List<ReviewEntity> reviews, GetReviewsUsecaseParams params)
      : super(reviews: reviews, params: params);
}

final class ReviewFailed extends ReviewState {
  const ReviewFailed(DioException error) : super(error: error);
}

final class ReviewsComplete extends ReviewState {
  const ReviewsComplete(
      List<ReviewEntity> reviews, GetReviewsUsecaseParams params)
      : super(reviews: reviews, params: params);
}
