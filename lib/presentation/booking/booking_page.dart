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
  String? errorMessage;

  final textCommentController = TextEditingController();

  void _handleBooking() {
    if (selectedDate == null || peopleCount == null) {
      setState(() {
        errorMessage = 'Please select an option';
      });
      return;
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
                  isRequired: true,
                  prefixIcon: Icons.numbers_sharp,
                  hint: 'Choose a number',
                  errorText: errorMessage,
                  items: List.generate(6, (index) {
                    return DropdownMenuItem<int>(
                      value: index,
                      child: Text(index.toString()),
                    );
                  }),
                  onChanged: (int? newValue) {
                    setState(() {
                      peopleCount = newValue;
                      errorMessage = null;
                    });
                  },
                ),
                CommonButton(onPressed: _handleBooking, text: 'Lets book!')
              ],
            ),
          )),
    );
  }
}
