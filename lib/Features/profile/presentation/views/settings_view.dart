import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/password_manager_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_divider.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_switch_list_tile.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/customlisttilewithicon.dart';
import 'package:store_powered_ai/main.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

bool isNotificationEnabled = false;

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileCustomAppBar(
        title: 'Settings',
      ),
      body: ListView(
        children: [
          CustomListTileWithIcons(
            sIcon: const Icon(Icons.key_outlined),
            text: 'Password Manager',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PasswordManagerView();
              }));
            },
          ),
          const CustomDivider(),
          // CustomSwitchListTile(
          //   sIcon: Icon(Icons.notifications),
          //   text: 'Notification Settings',
          //   value: isNotificationEnabled,
          //   onChanged: (value) {
          //     isNotificationEnabled = value;
          //   },
          // ),
          // const CustomDivider(),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, currentThemeMode, _) {
              return CustomSwitchListTile(
                sIcon: const Icon(Icons.mode_night),
                text: 'Dark Mode',
                value: currentThemeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
              );
            },
          ),
          // const CustomDivider(),
          // CustomListTileWithIcons(
          //   sIcon: const Icon(Icons.backspace),
          //   text: 'Delete Account',
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
