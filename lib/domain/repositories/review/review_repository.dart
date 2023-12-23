import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/review/review_entity.dart';

abstract class ReviewRepository {
  Future<DataState<List<ReviewEntity>>> getReviews({
    required ReviewParams params,
  });
}

class ReviewParams {
  final String? tutorId;
  final int? page;
  final int? perPage;

  ReviewParams({
    this.tutorId,
    this.page,
    this.perPage,
  });

  ReviewParams copyWith({
    final String? tutorId,
    int? page,
    int? perPage,
  }) {
    return ReviewParams(
      tutorId: tutorId ?? this.tutorId,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}
