import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //Enter Username
          ListTile(
            title: TextFormField(
              initialValue: settings.name,
              onChanged: (value) {
                settings.name = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your name here',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            title: Text('Theme Mode'),
            trailing: DropdownButton(
              value: settings.themeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System'),
                ),
              ],
              onChanged: (value) {
                settings.themeMode = value!;
              },
            ),
          ),
          ListTile(
            title: Text('Theme Color'),
            trailing: DropdownButton(
              value: settings.sourceColor.value,
              items: [
                DropdownMenuItem(
                  value: Colors.red.value,
                  child: Text('Red'),
                ),
                DropdownMenuItem(
                  value: Colors.green.value,
                  child: Text('Green'),
                ),
                DropdownMenuItem(
                  value: Colors.blue.value,
                  child: Text('Blue'),
                ),
                DropdownMenuItem(
                  value: Colors.yellow.value,
                  child: Text('Yellow'),
                ),
              ],
              onChanged: (value) {
                settings.sourceColor = Color(value!);
              },
            ),
          ),
          //Button showing details screen
          ListTile(
            title: const Text('Details'),
            leading: const Icon(Icons.sticky_note_2),
            trailing: Icon(Icons.chevron_right),
            onTap: () => showDetails(context),
          )
        ],
      ),
    );
  }

//this should lead to details screen
  void showDetails(BuildContext context) {
    final nav = Navigator.of(context);
    nav.pushNamed("/details");
  }
}
