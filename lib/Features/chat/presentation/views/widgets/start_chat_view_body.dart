import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/chat_view.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class StartChatViewBody extends StatelessWidget {
  const StartChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsData.hugeiconsAiNetwork),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Welcome to Chat with AI',
            style: Styles.textStyle20(context),
          ),
          Text(
            'Your Personal Fashion Assistant,\nReady to Help You Shine',
            textAlign: TextAlign.center,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 51,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatView();
              }));
            },
            child: Text(
              'Start Chat',
              style: Styles.textStyle20(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
