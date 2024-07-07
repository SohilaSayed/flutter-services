import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const IconCard({super.key, required this.icon, required this.label, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
            color: color.withOpacity(0.2), // Background color with opacity
          ),
          child: Icon(
            icon,
            size: 30.0,
            color: color,
          ),
        ),

        const SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}
