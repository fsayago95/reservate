import 'package:flutter/material.dart';
import 'package:reservate/core/widgets/common_button.dart';
import 'package:reservate/core/widgets/common_date_picker.dart';
import 'package:reservate/core/widgets/common_dropdown.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  int? peopleCount;

  String? dateError;
  String? peopleError;

  final textCommentController = TextEditingController();

  void _handleBooking() {
    setState(() {
      dateError = selectedDate == null ? 'Please select a date' : null;
      peopleError = peopleCount == null ? 'Please select a number' : null;
    });

    if (dateError == null && peopleError == null) {
      print('Proceed with booking: $selectedDate, $peopleCount people');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const CommonDatePicker(),
              CommonDropdown<int>(
                label: 'Select quantity',
                value: peopleCount,
                prefixIcon: Icons.numbers_sharp,
                hint: 'Choose a number',
                errorText: peopleError,
                items: List.generate(6, (i) {
                  final value = i + 1; // start at 1
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }),
                onChanged: (newValue) {
                  setState(() {
                    peopleCount = newValue;
                    peopleError = null;
                  });
                },
              ),
              CommonButton(
                onPressed: _handleBooking,
                text: "Check availability",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
