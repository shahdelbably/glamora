import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_text_inprivacy_policy.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/build_label.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileCustomAppBar(title: 'Privacy Policy'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLabel('Cancelation Policy', FontWeight.bold),
              const SizedBox(height: 8),
              const CustomTextinPrivacyPolicy(
                  text:
                      'At GLAMORA, you can cancel your order within 24 hours for free. After 24 hours but before shipping, a small fee may apply. Once shipped, cancellations aren’t possible, but you can return items based on our refund policy. Personalized items cannot be canceled. Refunds for eligible cancellations will be processed within a few business days.'),
              const SizedBox(height: 12),
              buildLabel('Terms & Condition', FontWeight.bold),
              const SizedBox(height: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextinPrivacyPolicy(
                    text:
                        'By accessing and using GLAMORA, you agree to comply with the following terms and conditions. All products, prices, descriptions, and promotions displayed on our website are subject to change at any time without prior notice. Orders placed on the website are subject to availability, and we reserve the right to limit or cancel quantities purchased per person, household, or order. In the event of a canceled order, we will notify you via the contact information provided during checkout.',
                  ),
                  SizedBox(height: 18),
                  CustomTextinPrivacyPolicy(
                      text:
                          'Customers are responsible for ensuring that all personal and payment details provided are accurate and up-to-date. We are not liable for delays, shipping errors, or missed deliveries due to incorrect information. The use of our products is intended for personal, non-commercial purposes, and the resale of any items purchased from GLAMORA is strictly prohibited without prior written consent.'),
                  SizedBox(height: 18),
                  CustomTextinPrivacyPolicy(
                      text:
                          'All content, including images, text, logos, and designs on the website, is the intellectual property of GLAMORA and may not be copied, distributed, or used for any purpose without our express permission. Unauthorized use of the website or its content, including fraudulent activity or attempts to disrupt the website’s functionality, is strictly prohibited and may result in legal action.')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
