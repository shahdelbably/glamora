import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "question": "What services do you offer?",
      "answer": "Glamora offers several essential services to provide a seamless and enjoyable shopping experience for customers."
    },
    {
      "question": "How can I find clothing that suits me?",
      "answer": "Our AI-powered styling assistant helps you find the perfect outfit based on your preferences."
    },
    {
      "question": "Can I try on clothes virtually before buying?",
      "answer": "Yes! Our virtual try-on feature lets you see how clothes look on you before purchasing."
    },
    {
      "question": "How do I choose the right size?",
      "answer": "We provide a detailed size guide and personalized recommendations."
    },
    {
      "question": "What payment methods are available?",
      "answer": "We support Credit Card, PayPal, and other secure payment options."
    },
    {
      "question": "How can I contact customer service?",
      "answer": "You can reach us through live chat, email, or phone support."
    },
  ];

   FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  faqs[index]["question"]!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                iconColor: Colors.grey,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(color: Colors.grey, thickness: 1, endIndent: 6, indent: 6),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      faqs[index]["answer"]!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}