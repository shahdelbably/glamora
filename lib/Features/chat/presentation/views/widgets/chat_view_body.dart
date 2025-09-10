import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_powered_ai/Features/chat/data/models/message_model.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/custom_chat_after_messages.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/custom_chat_before_messages.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/message_text_field.dart';
import 'package:store_powered_ai/core/utils/services/api_chat_services.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

final geminiServiceProvider = Provider<GeminiService>((ref) => GeminiService());

class ChatViewBody extends ConsumerStatefulWidget {
  const ChatViewBody({super.key});

  @override
  ConsumerState<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends ConsumerState<ChatViewBody> {
  final TextEditingController _controller = TextEditingController();
  final List<MessageModel> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isPaused = false;
  bool get _isNearBottom {
    if (!_scrollController.hasClients) return true;
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    return (maxScroll - currentScroll) < 100;
  }

  Future<void> _callGeminiModel() async {
    if (_controller.text.isEmpty) return;
    setState(() {
      _isLoading = true;
      _isPaused = false;
      _messages.add(MessageModel(text: _controller.text, isUser: true));
      _messages
          .add(MessageModel(text: "", isUser: false)); // مكان للرد التدريجي
    });

    _scrollToBottom(force: true); // 🔥 أول مرة يجبره ينزل

    try {
      final prompt = _controller.text.trim();
      Stream<String> responseStream =
          ref.read(geminiServiceProvider).generateResponse(prompt);

      String accumulatedResponse = "";
      _controller.clear();

      await for (var chunk in responseStream) {
        if (_isPaused) break;
        for (var char in chunk.split("")) {
          await Future.delayed(
              const Duration(milliseconds: 30)); // تأثير الكتابة
          setState(() {
            accumulatedResponse += char;
            _messages[_messages.length - 1] =
                MessageModel(text: accumulatedResponse, isUser: false);
          });
          _scrollToBottom(force: false);
        }
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog(e.toString());
    }
  }

  void _scrollToBottom({bool force = false}) {
    if (!_scrollController.hasClients) return;

    if (force || _isNearBottom) {
      // 🔥 تحريك فقط لو المستخدم في آخر الرسائل أو لو بنبعت رسالة جديدة
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(
            message,
            style: Styles.textStyle12(context),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _messages.isEmpty
            ? const Expanded(child: CustomChatBeforeMessages())
            : Expanded(
                child: CustomChatAfterMessages(
                messages: _messages,
                scrollController: _scrollController,
              )),
        MessageTextField(
          controller: _controller,
          isLoading: _isLoading,
          onSend: _callGeminiModel,
          onPasued: () {
            setState(() {
              _isPaused = !_isPaused;
            });
          },
        )
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:store_powered_ai/Features/chat/data/models/message_model.dart';
// import 'package:store_powered_ai/Features/chat/presentation/views/widgets/custom_chat_after_messages.dart';
// import 'package:store_powered_ai/Features/chat/presentation/views/widgets/custom_chat_before_messages.dart';
// import 'package:store_powered_ai/Features/chat/presentation/views/widgets/message_text_field.dart';
// import 'package:store_powered_ai/core/utils/services/api_chat_services.dart';
// import 'package:store_powered_ai/core/utils/styles.dart';

// final geminiServiceProvider = Provider<GeminiService>(
//     (ref) => GeminiService(apiKey: "AIzaSyCEKyXde9npZGm1BFEon8I9Z0nQjBaqHyc"));

// class ChatViewBody extends ConsumerStatefulWidget {
//   const ChatViewBody({super.key});

//   @override
//   ConsumerState<ChatViewBody> createState() => _ChatViewBodyState();
// }

// class _ChatViewBodyState extends ConsumerState<ChatViewBody> {
//   final TextEditingController _controller = TextEditingController();
//   final List<MessageModel> _messages = [];
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;
//   bool _isPaused = false;

//   bool get _isNearBottom {
//     if (!_scrollController.hasClients) return true;
//     double maxScroll = _scrollController.position.maxScrollExtent;
//     double currentScroll = _scrollController.position.pixels;
//     return (maxScroll - currentScroll) < 100;
//   }

//   Future<void> _callGeminiModel() async {
//     final prompt = _controller.text.trim();
//     if (prompt.isEmpty || _isLoading) return;

//     setState(() {
//       _isLoading = true;
//       _isPaused = false;
//       _messages.add(MessageModel(text: prompt, isUser: true));
//       _messages.add(MessageModel(text: "", isUser: false)); // Placeholder
//     });

//     _scrollToBottom(force: true);

//     try {
//       _controller.clear();
//       final stream =
//           ref.read(geminiServiceProvider).generateResponseStream(prompt);
//       String responseBuffer = "";

//       await for (final chunk in stream) {
//         if (_isPaused) break;

//         responseBuffer += chunk;

//         setState(() {
//           _messages[_messages.length - 1] = MessageModel(
//             text: responseBuffer,
//             isUser: false,
//           );
//         });

//         _scrollToBottom(force: false);
//         await Future.delayed(const Duration(milliseconds: 40));
//       }
//     } catch (e) {
//       _showErrorDialog(e.toString());
//      } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _scrollToBottom({bool force = false}) {
//     if (!_scrollController.hasClients) return;

//     if (force || _isNearBottom) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       });
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('خطأ'),
//           content: Text(message, style: Styles.textStyle12(context)),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('حسناً'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _messages.isEmpty
//             ? const Expanded(child: CustomChatBeforeMessages())
//             : Expanded(
//                 child: CustomChatAfterMessages(
//                   messages: _messages,
//                   scrollController: _scrollController,
//                 ),
//               ),
//         MessageTextField(
//           controller: _controller,
//           isLoading: _isLoading,
//           onSend: _callGeminiModel,
//           onPasued: () {
//             setState(() {
//               _isPaused = !_isPaused;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
