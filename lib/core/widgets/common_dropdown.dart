import 'package:flutter/material.dart';

class CommonDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? errorText;
  final bool isRequired;
  final IconData? prefixIcon;
  final bool enabled;
  final String? hint;

  const CommonDropdown({
    super.key,
    required this.label,
    required this.items,
    this.value,
    this.onChanged,
    this.errorText,
    this.isRequired = false,
    this.prefixIcon,
    this.enabled = true,
    this.hint,
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
                      style: TextStyle(
                        color: theme.colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
          ),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: enabled ? onChanged : null,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: errorText,
            hintText: hint,
          ),
          style: theme.textTheme.bodyMedium,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
        ),
      ],
    );
  }
}
