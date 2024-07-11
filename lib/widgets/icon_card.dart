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


class IconCard2 extends StatelessWidget {
  final String? imageUrl;
  final String label;
  final Color color;

  const IconCard2({
    Key? key,
    required this.imageUrl,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
          ),
          child: imageUrl != null
              ? ClipOval(
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: color);
              },
            ),
          )
              : Icon(
            Icons.miscellaneous_services,
            color: color,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
