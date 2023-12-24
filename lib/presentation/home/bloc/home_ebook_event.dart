part of 'home_ebook_bloc.dart';

sealed class HomeEbookEvent extends Equatable {
  const HomeEbookEvent();

  @override
  List<Object> get props => [];
}

final class FetchEbook extends HomeEbookEvent {
  const FetchEbook();
}
