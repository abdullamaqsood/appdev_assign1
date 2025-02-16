import 'package:flutter/material.dart';

class MyStats extends StatelessWidget {
  const MyStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatTile('19', 'Posts'),
        const SizedBox(width: 100),
        _buildStatTile('32', 'Comments'),
      ],
    );
  }

  Widget _buildStatTile(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF77F00),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
