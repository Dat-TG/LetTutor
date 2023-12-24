part of 'course_bloc.dart';

sealed class CourseState extends Equatable {
  final List<CourseEntity>? courses;
  final GetListCoursesUsecaseParams? params;
  final DioException? error;
  final List<MapEntry<int, String>>? level;
  final String? order;
  final TextEditingController? orderBy;
  final List<MapEntry<String, String>>? categoryId;
  final TextEditingController? q;
  const CourseState({
    this.courses,
    this.error,
    this.params,
    this.level,
    this.order,
    this.orderBy,
    this.categoryId,
    this.q,
  });

  @override
  List<Object?> get props => [
        courses,
        error,
        params,
        level,
        order,
        orderBy,
        categoryId,
        q,
      ];
}

final class CourseLoading extends CourseState {
  const CourseLoading({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
    List<MapEntry<int, String>>? level,
    String? order,
    TextEditingController? orderBy,
    List<MapEntry<String, String>>? categoryId,
    TextEditingController? q,
  }) : super(
          courses: courses,
          params: params,
          error: error,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryId: categoryId,
          q: q,
        );
}

final class CourseUpdateFilters extends CourseState {
  const CourseUpdateFilters({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
    List<MapEntry<int, String>>? level,
    String? order,
    TextEditingController? orderBy,
    List<MapEntry<String, String>>? categoryId,
    TextEditingController? q,
  }) : super(
          courses: courses,
          params: params,
          error: error,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryId: categoryId,
          q: q,
        );
}

final class CourseDone extends CourseState {
  const CourseDone({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
    List<MapEntry<int, String>>? level,
    String? order,
    TextEditingController? orderBy,
    List<MapEntry<String, String>>? categoryId,
    TextEditingController? q,
  }) : super(
          courses: courses,
          params: params,
          error: error,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryId: categoryId,
          q: q,
        );
}

final class CourseNotFound extends CourseState {
  const CourseNotFound({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
    List<MapEntry<int, String>>? level,
    String? order,
    TextEditingController? orderBy,
    List<MapEntry<String, String>>? categoryId,
    TextEditingController? q,
  }) : super(
          courses: courses,
          params: params,
          error: error,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryId: categoryId,
          q: q,
        );
}

final class CourseFailed extends CourseState {
  const CourseFailed({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
    List<MapEntry<int, String>>? level,
    String? order,
    TextEditingController? orderBy,
    List<MapEntry<String, String>>? categoryId,
    TextEditingController? q,
  }) : super(
          courses: courses,
          params: params,
          error: error,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryId: categoryId,
          q: q,
        );
}

final class CourseCompleted extends CourseState {
  const CourseCompleted({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
    List<MapEntry<int, String>>? level,
    String? order,
    TextEditingController? orderBy,
    List<MapEntry<String, String>>? categoryId,
    TextEditingController? q,
  }) : super(
          courses: courses,
          params: params,
          error: error,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryId: categoryId,
          q: q,
        );
}
