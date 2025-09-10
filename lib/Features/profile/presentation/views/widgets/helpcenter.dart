import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/contact_section.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/faqsection.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).textTheme.bodyLarge!.color!,
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: Theme.of(context).textTheme.bodyLarge!.color!,
                    width: 2.0),
                insets: const EdgeInsets.symmetric(horizontal: 80.0),
              ),
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: "FAQ"),
                Tab(text: "Contact Us"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FAQSection(),
                ContactSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
