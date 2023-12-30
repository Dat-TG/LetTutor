part of 'ebook_bloc.dart';

sealed class EbookEvent extends Equatable {
  const EbookEvent();

  @override
  List<Object> get props => [];
}

final class EbookFetching extends EbookEvent {
  final GetListEbooksUsecaseParams params;
  const EbookFetching({required this.params});
}
