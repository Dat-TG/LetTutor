import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/review/review_entity.dart';
import 'package:let_tutor/domain/repositories/review/review_repository.dart';

class GetReviewsUsecase
    implements UseCase<DataState<List<ReviewEntity>>, ReviewParams> {
  final ReviewRepository _reviewRepository;
  GetReviewsUsecase(this._reviewRepository);

  @override
  Future<DataState<List<ReviewEntity>>> call({ReviewParams? params}) {
    return _reviewRepository.getReviews(
      params: params!,
    );
  }
}
