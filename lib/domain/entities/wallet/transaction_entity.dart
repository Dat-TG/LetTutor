import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String? type;
  final DateTime? time;
  final String? tutor;
  const TransactionEntity({
    required this.type,
    required this.time,
    required this.tutor,
  });
  @override
  List<Object?> get props => [type, time, tutor];
}
