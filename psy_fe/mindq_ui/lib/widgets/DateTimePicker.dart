import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTimePicker extends StatefulWidget {
  @override
  _DateAndTimePickerState createState() => _DateAndTimePickerState();
}

class _DateAndTimePickerState extends State<DateAndTimePicker> {
  TextEditingController _dateTimeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _updateDateTimeText();
      });
    }
  }

  // Function to show the time picker in a BottomSheet
  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _updateDateTimeText();
      });
    }
  }

  void _updateDateTimeText() {
    _dateTimeController.text =
        DateFormat('dd-MMM-yyyy').format(_selectedDate) +
            ' ' +
            _selectedTime.format(context);
  }
  void _showDateTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min, // Make the column take up minimum space
                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showDatePicker(context);
                      },
                      child: Text("Select Date"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showTimePicker(context);
                      },
                      child: Text("Select Time"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the BottomSheet
                      },
                      child: Text("Done"),
                    ),
                  ],
                )
              ],
            )
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Don't call _updateDateTimeText here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateDateTimeText(); // Call it here instead
  }

  @override
  void dispose() {
    _dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDateTimePicker(context);
      },
      child: IgnorePointer(
        child: TextField(
          controller: _dateTimeController,
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            prefixIcon: Icon(Icons.calendar_today_rounded),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}