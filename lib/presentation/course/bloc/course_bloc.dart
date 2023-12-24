import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';
import 'package:let_tutor/domain/usecases/course/get_list_courses.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetListCoursesUsecase _getListCoursesUsecase;
  CourseBloc(this._getListCoursesUsecase)
      : super(CourseLoading(
          categoryId: const [],
          level: const [],
          order: null,
          orderBy: TextEditingController(),
          q: TextEditingController(),
        )) {
    on<CourseFetching>(onSearch);
    on<CourseUpdateLevel>(onUpdateLevel);
    on<CourseUpdateOrder>(onUpdateOrder);
    on<CourseUpdateCategoryId>(onUpdateCategoryId);
  }

  void onSearch(CourseFetching event, Emitter<CourseState> emit) async {
    emit(CourseLoading(
      courses: state.courses,
      params: event.params.copyWith(page: state.params?.page ?? 0),
      error: state.error,
      level: state.level,
      order: state.order,
      orderBy: state.orderBy,
      categoryId: state.categoryId,
      q: state.q,
    ));
    final dataState = await _getListCoursesUsecase(params: event.params);
    print('page ${event.params.page}  ${dataState.data?.length}');
    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if ((event.params.page) > (state.params?.page ?? 0)) {
          emit(CourseDone(
            courses: [...(state.courses ?? []), ...(dataState.data ?? [])],
            params: event.params,
            error: state.error,
            level: state.level,
            order: state.order,
            orderBy: state.orderBy,
            categoryId: state.categoryId,
            q: state.q,
          ));
        } else {
          emit(CourseDone(
            courses: dataState.data ?? [],
            params: event.params,
            error: state.error,
            level: state.level,
            order: state.order,
            orderBy: state.orderBy,
            categoryId: state.categoryId,
            q: state.q,
          ));
        }
      } else {
        if (event.params.page == 1 || state.courses!.isEmpty) {
          print('Course not found');
          emit(CourseNotFound(
            courses: const [],
            params: event.params,
            error: state.error,
            level: state.level,
            order: state.order,
            orderBy: state.orderBy,
            categoryId: state.categoryId,
            q: state.q,
          ));
        } else {
          emit(CourseCompleted(
            courses: state.courses ?? [],
            params: event.params,
            error: state.error,
            level: state.level,
            order: state.order,
            orderBy: state.orderBy,
            categoryId: state.categoryId,
            q: state.q,
          ));
        }
      }
    }

    if (dataState is DataFailed) {
      emit(CourseFailed(
        courses: state.courses ?? [],
        params: event.params,
        error: dataState.error,
        level: state.level,
        order: state.order,
        orderBy: state.orderBy,
        categoryId: state.categoryId,
        q: state.q,
      ));
    }
  }

  void onUpdateLevel(CourseUpdateLevel event, Emitter<CourseState> emit) {
    emit(CourseUpdateFilters(
      courses: state.courses,
      params: state.params,
      error: state.error,
      level: event.level,
      order: state.order,
      orderBy: state.orderBy,
      categoryId: state.categoryId,
      q: state.q,
    ));
  }

  void onUpdateOrder(CourseUpdateOrder event, Emitter<CourseState> emit) {
    emit(CourseUpdateFilters(
      courses: state.courses,
      params: state.params,
      error: state.error,
      level: state.level,
      order: event.order,
      orderBy: state.orderBy,
      categoryId: state.categoryId,
      q: state.q,
    ));
  }

  void onUpdateCategoryId(
      CourseUpdateCategoryId event, Emitter<CourseState> emit) {
    emit(CourseUpdateFilters(
      courses: state.courses,
      params: state.params,
      error: state.error,
      level: state.level,
      order: state.order,
      orderBy: state.orderBy,
      categoryId: event.categoryId,
      q: state.q,
    ));
  }
}
