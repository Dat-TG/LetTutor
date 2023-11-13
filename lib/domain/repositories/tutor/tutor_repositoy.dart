import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';

abstract class TutorRepository {
  Future<DataState<List<TutorEntity>>> getTutors({
    required String token,
    required TutorSearchParams params,
  });
}

class TutorSearchParams {
  final List<String>? specialties;
  final DateTime? date;
  final bool? isVietnamese;
  final bool? isNative;
  final List<int?>? tutoringTimeAvailable;
  final String? search;
  final int? page;
  final int? perPage;

  TutorSearchParams({
    this.specialties,
    this.date,
    this.isVietnamese,
    this.isNative,
    this.tutoringTimeAvailable,
    this.search,
    this.page,
    this.perPage,
  });

  TutorSearchParams copyWith({
    List<String>? specialties,
    DateTime? date,
    bool? isVietnamese,
    bool? isNative,
    List<int?>? tutoringTimeAvailable,
    String? search,
    int? page,
    int? perPage,
  }) {
    return TutorSearchParams(
      specialties: specialties ?? this.specialties,
      date: date ?? this.date,
      isVietnamese: isVietnamese,
      isNative: isNative,
      tutoringTimeAvailable:
          tutoringTimeAvailable ?? this.tutoringTimeAvailable,
      search: search ?? this.search,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filters': {
        'specialties': specialties ?? [],
        'date': date?.toIso8601String(),
        'nationality': (isVietnamese != null || isNative != null)
            ? {
                'isVietnamese': isVietnamese,
                'isNative': isNative,
              }
            : {},
        'tutoringTimeAvailable':
            date != null ? tutoringTimeAvailable ?? [null, null] : [null, null],
      },
      if (search != null) 'search': search,
      'page': page ?? 1,
      'perPage': perPage ?? 10,
    };
  }
}
