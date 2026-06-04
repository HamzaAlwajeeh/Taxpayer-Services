import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tax_payer/Features/Home/data/models/message_model.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messageModel, required this.isMe});
  final MessageModel messageModel;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.only(top: 12, bottom: 6, left: 12, right: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color:
              isMe
                  ? AppColors.primaryColor(context)
                  : AppColors.itemsColor(context),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              messageModel.message,
              style: TextStyle(color: Colors.white, fontSize: 18, height: 1.2),
            ),
            SizedBox(height: 5),
            Text(
              DateFormat('hh:mm a').format(messageModel.time),
              style: TextStyle(
                color: AppColors.textPrimaryColor(context),
                fontSize: 12,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
