import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';
import 'package:let_tutor/domain/repositories/course/course_repository.dart';

class GetListCoursesUsecase
    implements
        UseCase<DataState<List<CourseEntity>>, GetListCoursesUsecaseParams> {
  final CourseRepository _courseRepository;
  GetListCoursesUsecase(this._courseRepository);

  @override
  Future<DataState<List<CourseEntity>>> call(
      {GetListCoursesUsecaseParams? params}) {
    return _courseRepository.getListCourses(
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

class GetListCoursesUsecaseParams {
  final int page;
  final int size;
  final List<int>? level;
  final String? order;
  final String? orderBy;
  final List<String>? categoryId;
  final String? q;

  GetListCoursesUsecaseParams({
    required this.page,
    required this.size,
    required this.level,
    required this.order,
    required this.orderBy,
    required this.categoryId,
    required this.q,
  });

  GetListCoursesUsecaseParams copyWith({
    int? page,
    int? size,
    List<int>? level,
    String? order,
    String? orderBy,
    List<String>? categoryId,
    String? q,
  }) {
    return GetListCoursesUsecaseParams(
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
