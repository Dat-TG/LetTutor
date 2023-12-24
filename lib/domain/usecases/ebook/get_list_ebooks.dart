import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/ebook/ebook_entity.dart';
import 'package:let_tutor/domain/repositories/ebook/ebook_repository.dart';

class GetListEbooksUsecase
    implements
        UseCase<DataState<List<EbookEntity>>, GetListEbooksUsecaseParams> {
  final EbookRepository _ebookRepository;
  GetListEbooksUsecase(this._ebookRepository);

  @override
  Future<DataState<List<EbookEntity>>> call(
      {GetListEbooksUsecaseParams? params}) {
    return _ebookRepository.getListEbooks(
      page: params!.page,
      size: params.size,
    );
  }
}

class GetListEbooksUsecaseParams {
  final int page;
  final int size;

  GetListEbooksUsecaseParams({
    required this.page,
    required this.size,
  });

  GetListEbooksUsecaseParams copyWith({
    int? page,
    int? size,
  }) {
    return GetListEbooksUsecaseParams(
      page: page ?? 1,
      size: size ?? 5,
    );
  }
}
