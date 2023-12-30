part of 'home_ebook_bloc.dart';

sealed class HomeEbookState extends Equatable {
  final List<EbookEntity>? ebooks;
  final DioException? error;
  const HomeEbookState({
    this.ebooks,
    this.error,
  });

  @override
  List<Object?> get props => [ebooks, error];
}

final class EbookFetching extends HomeEbookState {
  const EbookFetching();
}

final class EbookFetched extends HomeEbookState {
  const EbookFetched({
    required List<EbookEntity> ebooks,
  }) : super(ebooks: ebooks);
}

final class EbookError extends HomeEbookState {
  const EbookError({
    required DioException error,
  }) : super(error: error);
}
