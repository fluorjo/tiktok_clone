import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // ListTile(
          //   onTap: () => showAboutDialog(
          //     context: context,
          //     applicationVersion: '1.0',
          //     applicationLegalese: 'All rights reserved. Please do not copy me',
          //   ),
          //   title: const Text(
          //     'About',
          //     style: TextStyle(
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   subtitle: const Text('About this app...'),
          // ),
          AboutListTile(),
        ],
      ),
    );
  }
}
