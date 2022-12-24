import 'package:flutter/material.dart';

class Macro extends StatelessWidget {
  const Macro({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,

      /// Instead of setting a color directly we can get a dynamic
      /// color token created by the theme
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            /// The theme also provides the [on] colors for ease of use
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
