import 'package:let_tutor/domain/entities/wallet/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    String? type,
    DateTime? time,
    String? tutor,
  }) : super(
          type: type,
          time: time,
          tutor: tutor,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      type: json['type'],
      time: DateTime.fromMillisecondsSinceEpoch(
          json['bookingInfo']['createdAtTimeStamp']),
      tutor: json['bookingInfo']['scheduleDetailInfo']['tutorInfo']['name'],
    );
  }
}
