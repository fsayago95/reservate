import 'package:flutter/material.dart';

class CommonDatePicker extends StatefulWidget {
  const CommonDatePicker({super.key});

  @override
  State<CommonDatePicker> createState() => _CommonDatePicker();
}

class _CommonDatePicker extends State<CommonDatePicker> {
  DateTime? selectedDate;
  DateTime? initialDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        OutlinedButton(
            onPressed: _selectDate, child: const Text('Select Date')),
      ],
    );
  }
}
