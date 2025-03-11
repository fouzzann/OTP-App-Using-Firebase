import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  
  const AuthHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon container
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 60,
            color: Colors.blue,
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Headline text
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Description text
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}