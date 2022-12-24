import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/details.dart';
import 'screens/home.dart';
import 'screens/settings.dart';
import 'state/settings.dart';

class MealTracker extends StatelessWidget {
  const MealTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsState()),
      ],
      child: Builder(builder: (context) {
        final settings = context.watch<SettingsState>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meal Tracker',
          theme: ThemeData.light(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: settings.sourceColor,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: settings.sourceColor,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: settings.themeMode,
          routes: {
            '/': (_) => const HomeScreen(),
            '/settings': (_) => SettingsScreen(),
            '/details': (_) => const DetailsScreen(),
          },
          initialRoute: '/',
        );
      }),
    );
  }
}
