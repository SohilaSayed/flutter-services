import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;

  const SectionHeader({super.key, required this.title, this.actionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          if (actionText != null)
            Text(
              actionText!,
              style: const TextStyle(color: Colors.green),
            ),
        ],
      ),
    );
  }
}
