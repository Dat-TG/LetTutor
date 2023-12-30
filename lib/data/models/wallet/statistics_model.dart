import 'package:let_tutor/domain/entities/wallet/statistics_entity.dart';

class StatisticsModel extends StatisticsEntity {
  const StatisticsModel({
    int? total,
    int? income,
    int? outcome,
  }) : super(
          income: income,
          outcome: outcome,
          total: total,
        );

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      total: json['total'],
      income: json['income'],
      outcome: json['outcome'],
    );
  }
}
