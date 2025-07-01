import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/utils/app_text_style.dart';

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



class PhoneInputFieldWidget extends StatefulWidget {
  final Function(String) onChanged;
  final String? initialValue;
  final String? errorText;
  final bool enabled;

  const PhoneInputFieldWidget({
    Key? key,
    required this.onChanged,
    this.initialValue,
    this.errorText,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<PhoneInputFieldWidget> createState() => _PhoneInputFieldWidgetState();
}

class _PhoneInputFieldWidgetState extends State<PhoneInputFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Phone Number',
            style: AppTextStyles.label,
          ),
        ),
        
        // Input Field Container
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.errorText != null
                  ? AppColors.borderError
                  : _isFocused
                      ? AppColors.borderFocused
                      : AppColors.borderPrimary,
              width: _isFocused ? 2 : 1,
            ),
            color: widget.enabled ? Colors.white : AppColors.cardBackground,
          ),
          child: Row(
            children: [
              // Country Code Prefix
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppColors.borderPrimary,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '🇮🇳',
                      style: AppTextStyles.bodyLarge,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+91',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Phone Number Input
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  style: AppTextStyles.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textHint,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  onChanged: (value) {
                    final completePhoneNumber = '+91$value';
                    widget.onChanged(completePhoneNumber);
                  },
                ),
              ),
            ],
          ),
        ),
        
        // Error Text
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 4),
            child: Text(
              widget.errorText!,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
      ],
    );
  }
}