import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Home/data/models/message_model.dart';
import 'package:tax_payer/Features/Home/presentation/logic/chat_cubit/chat_state.dart';
import 'package:tax_payer/core/constants/constants.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessageModel> messagesList = [];
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    AppConstants.kMessagesCollection,
  );

  void sendMessage({required String message, required String userName}) {
    try {
      if (message.trim().isEmpty) return;
      messages.add({
        AppConstants.kMessage: message,
        AppConstants.kCreatedAt: DateTime.now(),
        AppConstants.kUserName: userName,
      });
    } catch (e) {
      log('Error sending message: $e');
    }

    log('Message sent: $message');
  }

  void getMessages() {
    messages
        .orderBy(AppConstants.kCreatedAt, descending: true)
        .snapshots()
        .listen((event) {
          messagesList.clear();
          for (var doc in event.docs) {
            messagesList.add(
              MessageModel.fromJson(doc.data() as Map<String, dynamic>),
            );
          }

          emit(ChatSuccess());
        });
  }
}
