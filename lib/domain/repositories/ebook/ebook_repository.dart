import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/ebook/ebook_entity.dart';

abstract class EbookRepository {
  Future<DataState<List<EbookEntity>>> getListEbooks({
    required int page,
    required int size,
  });
}
