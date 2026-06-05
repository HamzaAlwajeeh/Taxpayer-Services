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
    final bubbleColor =
        isMe ? AppColors.primaryColor(context) : AppColors.itemsColor(context);
    final textColor = isMe ? Colors.white : AppColors.textBoldColor(context);
    final timeColor =
        isMe
            ? Colors.white.withValues(alpha: 0.78)
            : AppColors.textSecondaryColor(context);
    final alignment = isMe ? Alignment.centerLeft : Alignment.centerRight;
    final bubbleRadius =
        isMe
            ? const BorderRadiusDirectional.only(
              topStart: Radius.circular(22),
              topEnd: Radius.circular(22),
              bottomStart: Radius.circular(22),
              bottomEnd: Radius.circular(6),
            )
            : const BorderRadiusDirectional.only(
              topStart: Radius.circular(22),
              topEnd: Radius.circular(22),
              bottomStart: Radius.circular(6),
              bottomEnd: Radius.circular(22),
            );

    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
          minWidth: 86,
        ),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: bubbleRadius,
          border:
              isMe ? null : Border.all(color: AppColors.borderColor(context)),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              messageModel.message,
              textAlign: isMe ? TextAlign.start : TextAlign.end,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color:
                    isMe
                        ? Colors.white.withValues(alpha: 0.12)
                        : AppColors.scaffoldBackgroundColor(null, context),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  DateFormat('h:mm a').format(messageModel.time),
                  style: TextStyle(
                    color: timeColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
