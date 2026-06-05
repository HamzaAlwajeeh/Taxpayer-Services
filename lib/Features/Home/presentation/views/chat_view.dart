import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tax_payer/Features/Home/data/models/message_model.dart';
import 'package:tax_payer/Features/Home/presentation/logic/chat_cubit/chat_cubit.dart';
import 'package:tax_payer/Features/Home/presentation/logic/chat_cubit/chat_state.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/chat_bubble.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/chat_text_field.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final String currentUserName =
        Prefs.getUser(AppConstants.kCurrentUser)?.userName ?? 'User';
    return Scaffold(
      appBar: CustomAppBar(title: "خدمة العملاء", isChat: true),
      body: GradientBackground(
        isNotChat: false,
        hasCircleColors: false,
        child: Column(
          children: [
            Expanded(child: _buildMessagesList(context, currentUserName)),
            _buildChatTextField(currentUserName),
          ],
        ),
      ),
    );
  }

  Widget _buildMessagesList(BuildContext context, String currentUserName) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
        if (messagesList.isEmpty) {
          return const _EmptyChatState();
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
          physics: const BouncingScrollPhysics(),
          reverse: true,
          controller: _scrollController,
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            final message = messagesList[index];
            final showDateSeparator = _shouldShowDateSeparator(
              messagesList,
              index,
            );

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showDateSeparator) _DateSeparator(date: message.time),
                ChatBubble(
                  messageModel: message,
                  isMe: message.isSentByCurrentUser(currentUserName),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildChatTextField(String currentUserName) {
    return Builder(
      builder: (context) {
        return ChatTextField(
          controller: _controller,
          onPressed: () {
            sendMesage(
              context,
              text: _controller.text,
              currentUserName: currentUserName,
            );
          },
          onSubmitted: (text) {
            sendMesage(context, text: text, currentUserName: currentUserName);
          },
        );
      },
    );
  }

  void sendMesage(
    BuildContext context, {
    required String text,
    required String currentUserName,
  }) {
    BlocProvider.of<ChatCubit>(
      context,
    ).sendMessage(message: text, userName: currentUserName);
    _controller.clear();
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  bool _shouldShowDateSeparator(List<MessageModel> messages, int index) {
    if (index == messages.length - 1) return true;

    final currentDate = messages[index].time;
    final olderDate = messages[index + 1].time;
    return !_isSameDay(currentDate, olderDate);
  }

  bool _isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }
}

class _DateSeparator extends StatelessWidget {
  const _DateSeparator({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.itemsColor(context),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.borderColor(context)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor(context),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: Text(
            _formatDateLabel(date),
            style: TextStyle(
              color: AppColors.textSecondaryColor(context),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }

  String _formatDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay = DateTime(date.year, date.month, date.day);
    final difference = today.difference(messageDay).inDays;

    if (difference == 0) return 'اليوم';
    if (difference == 1) return 'أمس';
    return DateFormat('d MMM yyyy').format(date);
  }
}

class _EmptyChatState extends StatelessWidget {
  const _EmptyChatState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: AppColors.primaryColor(context).withValues(alpha: 0.10),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor(
                    context,
                  ).withValues(alpha: 0.18),
                ),
              ),
              child: Icon(
                Icons.support_agent_rounded,
                color: AppColors.primaryColor(context),
                size: 34,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'ابدأ محادثتك مع خدمة العملاء',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textBoldColor(context),
                fontSize: 17,
                fontWeight: FontWeight.w800,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'اكتب رسالتك وسيتم الرد عليك في اقرب وقت ممكن',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondaryColor(context),
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
