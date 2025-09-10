import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/widgets/elevated_button.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/widgets/gouped_image.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/widgets/texts.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: GroupedImage(),
        )),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Texts(
                text: 'NEW FASHION COLLECTION',
                color: Color(0xff6E685F),
                fontsize: 12,
                fontWeight: null,
              ),
              const SizedBox(height: 8),
              Texts(
                text: 'Start Discovering Your Unique Fashion Style',
                color: Theme.of(context).textTheme.bodyLarge!.color!,
                fontsize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 24),
              const ElvatedButton(),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ],
    );
  }
}
