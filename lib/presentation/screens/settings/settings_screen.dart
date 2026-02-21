import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: const [
          ListTile(leading: Icon(Icons.lock), title: Text('PIN Lock & Biometric')),
          ListTile(leading: Icon(Icons.backup), title: Text('Backup & Restore')),
          ListTile(leading: Icon(Icons.description), title: Text('Privacy Policy')),
          ListTile(leading: Icon(Icons.language), title: Text('ভাষা / Language')),
        ],
      ),
    );
  }
}
