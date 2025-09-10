import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/chat/data/models/message_model.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/custom_message_bubble.dart';

class CustomChatAfterMessages extends StatelessWidget {
  final List<MessageModel> messages;
  final ScrollController scrollController;

  const CustomChatAfterMessages(
      {super.key, required this.messages, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return messages[index].isUser
            ? ChatWidgetBubble(
                msg: messages[index].text,
              )
            : ChatWidgetBubblefriend(
                msg: messages[index].text,
              );
      },
    );
  }
}
