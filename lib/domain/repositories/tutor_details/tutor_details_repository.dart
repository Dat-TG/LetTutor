import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor_details/tutor_details_entity.dart';

abstract class TutorDetailsRepository {
  Future<DataState<TutorDetailsEntity>> getTutorDetails({
    required String token,
    required String id,
  });
}
