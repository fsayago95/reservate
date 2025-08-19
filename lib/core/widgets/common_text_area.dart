import 'package:flutter/material.dart';

class CommonTextArea extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? hintText;
  final String? errorText;
  final TextEditingController controller;
  final bool enabled;
  final TextInputType keyboardType;

  const CommonTextArea({
    super.key,
    required this.label,
    required this.isRequired,
    this.hintText,
    this.errorText,
    required this.controller,
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
          maxLines: null,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
