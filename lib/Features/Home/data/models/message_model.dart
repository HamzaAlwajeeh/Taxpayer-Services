import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_payer/core/constants/constants.dart';

class MessageModel {
  final String message;
  final String userName;
  final DateTime time;

  MessageModel({
    required this.message,
    required this.time,
    required this.userName,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
      message: json[AppConstants.kMessage] ?? '',
      userName: json[AppConstants.kUserName] ?? '',
      time: (json[AppConstants.kCreatedAt] as Timestamp).toDate(),
    );
  }
}
