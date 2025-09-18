import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final String hint;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      hint: Text(hint),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(itemLabel(e))))
          .toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
