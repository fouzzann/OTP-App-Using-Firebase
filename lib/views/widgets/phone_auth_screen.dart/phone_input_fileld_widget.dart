import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onPhoneChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      initialCountryCode: 'IN', // Change to your default country code
      onChanged: (phone) {
        onPhoneChanged(phone.completeNumber);
      },
    );
  }
}