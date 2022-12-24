import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/settings.dart';
import '../widgets/macro.dart';

// Trying to get the username from settings screen to appear

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Tracker'),
        actions: [
          IconButton(
            onPressed: () => showSettings(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Welcome ${settings.name}!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Macro(
                      label: 'Calories',
                    ),
                    Macro(
                      label: 'Protein',
                    ),
                    Macro(
                      label: 'Carbs',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSettings(BuildContext context) {
    final nav = Navigator.of(context);
    nav.pushNamed("/settings");
  }
}
