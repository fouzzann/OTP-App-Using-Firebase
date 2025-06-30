import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInputField extends StatelessWidget {
  final Function(String) onChanged;
  final String initialCountryCode;

  const PhoneInputField({
    super.key,
    required this.onChanged,
    this.initialCountryCode = 'IN',
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
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
      initialCountryCode: initialCountryCode,
      keyboardType: TextInputType.number, // Ensure numeric keyboard
      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Restrict to digits
      onChanged: (phone) {
        onChanged(phone.completeNumber);
      },
    );
  }
}
