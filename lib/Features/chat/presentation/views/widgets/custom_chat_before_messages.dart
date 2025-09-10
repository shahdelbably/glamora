import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/widgets/custom_container_chat_description.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomChatBeforeMessages extends StatelessWidget {
  const CustomChatBeforeMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Image.asset(
              AssetsData.hugeiconsAiNetworkChat,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Capabilities',
              style: Styles.textStyle18(context).copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF92929D),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomContainerChatDescription(
              text: 'Answer all your questions',
              text2: '(Just ask me anything you like)',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomContainerChatDescription(
              text: 'Personalized Style Recommendations',
              text2:
                  'Suggest outfits based on the user’s preferences, occasion, or weather',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomContainerChatDescription(
              text: 'Size & Fit Assistance',
              text2:
                  'Help users find the perfect size by analyzing their measurements or usual sizes in other brands.',
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'These are just a few examples of what i can do',
              style: Styles.textStyle12(context).copyWith(
                color: const Color(0xFF92929D),
              ),
            )
          ],
        ),
      ),
    );
  }
}
