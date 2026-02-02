import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default date
      firstDate: DateTime(2000), // Minimum date
      lastDate: DateTime(2100), // Maximum date
      initialEntryMode: DatePickerEntryMode.calendarOnly,

      builder: (BuildContext context, Widget? child) {
        return Theme(data: Theme.of(context).copyWith(), child: child!);
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text("Due Date", style: Theme.of(context).textTheme.bodyMedium),
        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(hintText: "dd/mm/yy"),
          readOnly: true,

          onTap: _pickDate,
        ),
      ],
    );
  }
}
