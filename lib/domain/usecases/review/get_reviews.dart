import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/review/review_entity.dart';
import 'package:let_tutor/domain/repositories/review/review_repository.dart';

class GetReviewsUsecase
    implements UseCase<DataState<List<ReviewEntity>>, GetReviewsUsecaseParams> {
  final ReviewRepository _reviewRepository;
  GetReviewsUsecase(this._reviewRepository);

  @override
  Future<DataState<List<ReviewEntity>>> call(
      {GetReviewsUsecaseParams? params}) {
    return _reviewRepository.getReviews(
      token: params!.token,
      params: params.params,
    );
  }
}

class GetReviewsUsecaseParams {
  final String token;
  final ReviewParams params;

  GetReviewsUsecaseParams({
    required this.token,
    required this.params,
  });

  GetReviewsUsecaseParams copyWith({
    String? token,
    ReviewParams? params,
  }) {
    return GetReviewsUsecaseParams(
      token: token ?? this.token,
      params: params ?? this.params,
    );
  }
}
