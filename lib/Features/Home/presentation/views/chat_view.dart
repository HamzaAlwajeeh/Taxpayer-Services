import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Home/presentation/logic/chat_cubit/chat_cubit.dart';
import 'package:tax_payer/Features/Home/presentation/logic/chat_cubit/chat_state.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/chat_bubble.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/chat_text_field.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final String currentUserName =
        Prefs.getUser(AppConstants.kCurrentUser)?.userName ?? 'User';
    return Scaffold(
      appBar: CustomAppBar(title: "خدمة العملاء"),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList(currentUserName)),
          _buildChatTextField(currentUserName),
        ],
      ),
    );
  }

  Widget _buildMessagesList(String currentUserName) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          controller: _scrollController,
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            var message = messagesList[index];
            return ChatBubble(
              messageModel: message,
              isMe: message.userName == currentUserName,
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
}
