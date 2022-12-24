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
    /// This comes from the [provider] package and is used to provide classes 
    /// to the whole widget tree using [InheritedWidgets]
    return MultiProvider(
      providers: [
        /// Here we can take the [SettingsState] class and created (calling the 
        /// constructor) and provide it to the application. When the value 
        /// is updated with [notifyListeners] the [ChangeNotifierProvider] will 
        /// get the change and request a new update.
        ChangeNotifierProvider(create: (_) => SettingsState()),
      ],
      child: Builder(builder: (context) {
        /// We can listen for the [SettingsState] and rebuild when we get 
        /// a new value after calling [notifyListeners]
        final settings = context.watch<SettingsState>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meal Tracker',
          theme: ThemeData.light(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              /// We can get the source [Color] from the state to 
              /// create a theme from
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
          /// Here we get the theme mode value from settings state
          themeMode: settings.themeMode,
          initialRoute: '/',
          routes: {
            '/': (_) => const HomeScreen(),
            '/settings': (_) => SettingsScreen(),
            '/details': (_) => const DetailsScreen(),
          },
        );
      }),
    );
  }
}
