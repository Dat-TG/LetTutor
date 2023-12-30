import 'package:equatable/equatable.dart';

class StatisticsEntity extends Equatable {
  final int? total;
  final int? income;
  final int? outcome;
  const StatisticsEntity({
    required this.total,
    required this.income,
    required this.outcome,
  });

  @override
  List<Object?> get props => [total, income, outcome];
}
