import 'package:flutter/material.dart';

class ResendCodeRow extends StatelessWidget {
  final Function() onResend;

  const ResendCodeRow({
    super.key,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't receive the code? ",
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        TextButton(
          onPressed: onResend,
          child: const Text(
            "Resend",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}