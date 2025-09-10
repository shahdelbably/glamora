import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final List<Map<String, dynamic>> contactOptions = [
    {
      "title": "Customer Services",
      "icon": Icons.headset_mic,
      "details": "We are here to help you with any questions or concerns."
    },
    {
      "title": "WhatsApp",
      "icon": FontAwesomeIcons.whatsapp,
      "details": "+562-987-179"
    },
    {
      "title": "Facebook",
      "icon": FontAwesomeIcons.facebook,
      "details": "Follow us on Facebook for the latest updates."
    },
    {
      "title": "Tiktok",
      "icon": FontAwesomeIcons.tiktok,
      "details": "Follow us on TikTok for the latest trends."
    },
    {
      "title": "Twitter",
      "icon": FontAwesomeIcons.twitter,
      "details": "Follow us on Twitter for the latest news."
    },
    {
      "title": "Instagram",
      "icon": FontAwesomeIcons.instagram,
      "details": "Follow us on Instagram for the latest photos."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: contactOptions.map((contact) {
                  return Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          leading: Icon(contact["icon"], color: Colors.grey),
                          title: Text(
                            contact["title"]!,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          children: contact.containsKey("details")
                              ? [
                                  const Divider(
                                      color: Colors.grey,
                                      indent: 6,
                                      endIndent: 6),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      contact["details"]!,
                                      style: const TextStyle(
                                          color: Colors
                                              .grey), // Set details text color to grey
                                    ),
                                  )
                                ]
                              : [],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                }).toList(),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: const Icon(Icons.chat_bubble,
                      color: Colors.grey), // Set icon color to grey
                  title: const Text(
                    "Live Chat",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  children: [
                    const Divider(
                        color: Colors.grey,
                        indent: 6,
                        endIndent:
                            6), // Add a divider between question and answer
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        "Sunday to Thursday, from 10:00 a.m. to 9:00 p.m.",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        onPressed: () {},
                        child: const Text("Begin Chat",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
