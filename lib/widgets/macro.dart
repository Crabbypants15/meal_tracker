import 'package:flutter/material.dart';

class Macro extends StatelessWidget {
  const Macro({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
