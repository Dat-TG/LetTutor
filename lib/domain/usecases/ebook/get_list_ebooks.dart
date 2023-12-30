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
      level: params.level,
      order: params.order,
      orderBy: params.orderBy,
      categoryId: params.categoryId,
      q: params.q,
    );
  }
}

class GetListEbooksUsecaseParams {
  final int page;
  final int size;
  final List<int>? level;
  final String? order;
  final String? orderBy;
  final List<String>? categoryId;
  final String? q;

  GetListEbooksUsecaseParams({
    required this.page,
    required this.size,
    required this.level,
    required this.order,
    required this.orderBy,
    required this.categoryId,
    required this.q,
  });

  GetListEbooksUsecaseParams copyWith({
    int? page,
    int? size,
    List<int>? level,
    String? order,
    String? orderBy,
    List<String>? categoryId,
    String? q,
  }) {
    return GetListEbooksUsecaseParams(
      page: page ?? 1,
      size: size ?? 5,
      level: level ?? this.level,
      order: order ?? this.order,
      orderBy: orderBy ?? this.orderBy,
      categoryId: categoryId ?? this.categoryId,
      q: q ?? this.q,
    );
  }
}
