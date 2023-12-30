part of 'review_bloc.dart';

sealed class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

final class ReviewFetched extends ReviewEvent {
  final ReviewParams params;
  const ReviewFetched(this.params);
}
