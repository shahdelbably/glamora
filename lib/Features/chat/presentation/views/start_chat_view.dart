import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/start_chat_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class StartChatView extends StatelessWidget {
  const StartChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: Styles.textStyle22(context),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 26,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
      body: const StartChatViewBody(),
    );
  }
}
