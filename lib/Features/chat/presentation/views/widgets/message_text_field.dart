import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onSend;
  final VoidCallback onPasued;

  const MessageTextField({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.onSend,
    required this.onPasued,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.grey.shade700 : const Color(0xFFD7D3D8),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLines: 5,
                  minLines: 1,
                  controller: controller,
                  cursorColor: isDark ? Colors.white : Colors.black,
                  style: Styles.textStyle12(context).copyWith(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Ask me anything',
                    hintStyle: Styles.textStyle12(context).copyWith(
                      color: const Color(0xff92929D),
                    ),
                    contentPadding: const EdgeInsets.only(left: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: isDark ? Colors.grey : const Color(0xff92929D),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: isDark ? Colors.grey : const Color(0xff92929D),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: isLoading ? onPasued : onSend,
                padding: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    isLoading ? Icons.stop_circle : Icons.send_sharp,
                    size: 30,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
