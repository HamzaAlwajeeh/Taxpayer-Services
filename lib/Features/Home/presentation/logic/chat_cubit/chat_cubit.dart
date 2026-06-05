import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Home/data/models/message_model.dart';
import 'package:tax_payer/Features/Home/presentation/logic/chat_cubit/chat_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<MessageModel> messagesList = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
  _messagesSubscription;

  String get _currentUserId {
    final user = Prefs.getUser(AppConstants.kCurrentUser);
    return user?.id.toString() ?? 'guest';
  }

  DocumentReference<Map<String, dynamic>> get _chatDoc =>
      _firestore.collection(AppConstants.kChatsCollection).doc(_currentUserId);

  CollectionReference<Map<String, dynamic>> get _messages =>
      _chatDoc.collection(AppConstants.kMessagesCollection);

  Future<void> sendMessage({
    required String message,
    required String userName,
  }) async {
    try {
      final trimmedMessage = message.trim();
      if (trimmedMessage.isEmpty) return;

      final now = DateTime.now();
      final batch = _firestore.batch();
      final messageDoc = _messages.doc();

      batch.set(_chatDoc, {
        AppConstants.kUserId: _currentUserId,
        AppConstants.kUserName: userName,
        AppConstants.kLastMessage: trimmedMessage,
        AppConstants.kUpdatedAt: now,
      }, SetOptions(merge: true));

      batch.set(messageDoc, {
        AppConstants.kMessage: trimmedMessage,
        AppConstants.kUserName: userName,
        AppConstants.kSenderType: AppConstants.kSenderTypeUser,
        AppConstants.kCreatedAt: now,
      });

      await batch.commit();
      log('Message sent: $trimmedMessage');
    } catch (e) {
      log('Error sending message: $e');
    }
  }

  void getMessages() {
    _messagesSubscription?.cancel();
    _messagesSubscription = _messages
        .orderBy(AppConstants.kCreatedAt, descending: true)
        .snapshots()
        .listen(
          (event) {
            messagesList.clear();
            for (var doc in event.docs) {
              messagesList.add(MessageModel.fromJson(doc.data()));
            }

            emit(ChatSuccess());
          },
          onError: (error) {
            log('Error getting messages: $error');
          },
        );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
