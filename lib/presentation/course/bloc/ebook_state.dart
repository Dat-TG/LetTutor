part of 'ebook_bloc.dart';

sealed class EbookState extends Equatable {
  final List<EbookEntity>? ebooks;
  final GetListEbooksUsecaseParams? params;
  final DioException? error;
  const EbookState({
    this.ebooks,
    this.error,
    this.params,
  });

  @override
  List<Object?> get props => [ebooks, error, params];
}

final class EbookLoading extends EbookState {
  const EbookLoading({
    List<EbookEntity>? ebooks,
    GetListEbooksUsecaseParams? params,
    DioException? error,
  }) : super(
          ebooks: ebooks,
          params: params,
          error: error,
        );
}

final class EbookDone extends EbookState {
  const EbookDone({
    List<EbookEntity>? ebooks,
    GetListEbooksUsecaseParams? params,
    DioException? error,
  }) : super(
          ebooks: ebooks,
          params: params,
          error: error,
        );
}

final class EbookNotFound extends EbookState {
  const EbookNotFound({
    List<EbookEntity>? ebooks,
    GetListEbooksUsecaseParams? params,
    DioException? error,
  }) : super(
          ebooks: ebooks,
          params: params,
          error: error,
        );
}

final class EbookFailed extends EbookState {
  const EbookFailed({
    List<EbookEntity>? ebooks,
    GetListEbooksUsecaseParams? params,
    DioException? error,
  }) : super(
          ebooks: ebooks,
          params: params,
          error: error,
        );
}

final class EbookCompleted extends EbookState {
  const EbookCompleted({
    List<EbookEntity>? ebooks,
    GetListEbooksUsecaseParams? params,
    DioException? error,
  }) : super(
          ebooks: ebooks,
          params: params,
          error: error,
        );
}
