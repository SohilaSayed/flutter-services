import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String label;

  const OrderCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.orange.withOpacity(0.1),
            child: const Icon(Icons.fastfood, size: 20.0, color: Colors.orange),
          ),
          const SizedBox(width: 16.0),
          Text(label, style: const TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
