import 'package:flutter/material.dart';

class PhoneAuthHeader extends StatelessWidget {
  const PhoneAuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phone verification icon
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.phone_android,
            size: 60,
            color: Colors.blue,
          ),
        ),

        const SizedBox(height: 40),

        // Headline text
        const Text(
          'Verify Your Phone Number',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        // Description text
        const Text(
          'We\'ll send you a one-time verification code to confirm your identity',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}