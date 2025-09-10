import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/helpcenter.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  HelpCenterState createState() => HelpCenterState();
}

class HelpCenterState extends State<HelpCenterView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileCustomAppBar(title: 'Help Center'),
      body: HelpCenterBody(tabController: _tabController),
    );
  }
}
