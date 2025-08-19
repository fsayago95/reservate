import 'package:flutter/material.dart';

class CommonInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;
  final bool isRequired;
  final IconData? prefixIcon;
  final bool enabled;
  final TextInputType keyboardType;

  const CommonInputField({
    super.key,
    required this.label,
    required this.controller,
    this.errorText,
    this.isRequired = false,
    this.prefixIcon,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RichText(
              text: TextSpan(
                text: label,
                style: theme.textTheme.labelMedium,
                children: [
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                ],
              ),
            ),
          ),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
