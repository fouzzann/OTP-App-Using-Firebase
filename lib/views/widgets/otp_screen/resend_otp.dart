import 'package:flutter/material.dart';

class OtpResendButton extends StatelessWidget {
  const OtpResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Didn't receive the code? ", style: TextStyle(color: Colors.black54, fontSize: 15)),
        TextButton(
          onPressed: () {
            // Resend OTP logic can be added here
          },
          child: const Text(
            "Resend",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
