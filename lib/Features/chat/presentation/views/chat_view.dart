import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: Styles.textStyle22(context),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 26,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        centerTitle: true,
      ),
      body: const ChatViewBody(),
    );
  }
}
