import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_payer/core/constants/constants.dart';

class MessageModel {
  final String message;
  final String userName;
  final String senderType;
  final DateTime time;

  MessageModel({
    required this.message,
    required this.time,
    required this.userName,
    required this.senderType,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json[AppConstants.kMessage] ?? '',
      userName: json[AppConstants.kUserName] ?? '',
      senderType: json[AppConstants.kSenderType] ?? '',
      time: _readTime(json[AppConstants.kCreatedAt]),
    );
  }

  bool isSentByCurrentUser(String currentUserName) {
    return senderType == AppConstants.kSenderTypeUser ||
        userName == currentUserName;
  }

  static DateTime _readTime(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    return DateTime.now();
  }
}
