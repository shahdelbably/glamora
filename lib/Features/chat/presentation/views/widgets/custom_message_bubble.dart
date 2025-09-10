// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class ChatWidgetBubble extends StatelessWidget {
  const ChatWidgetBubble({
    super.key,
    required this.msg,
  });
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: const Color(0x66E9E6EA).withOpacity(0.4),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: IntrinsicWidth(
          child: Text(
            msg,
            style: Styles.textStyle12(context),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class ChatWidgetBubblefriend extends StatelessWidget {
  const ChatWidgetBubblefriend({
    super.key,
    required this.msg,
  });
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: const Color(0x3392929D).withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align time to the right
            children: [
              Text(
                msg,
                style: Styles.textStyle12(context),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
