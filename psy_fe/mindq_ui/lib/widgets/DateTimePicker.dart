import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/styles/color_const.dart';

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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        Navigator.pop(context);
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateDateTimeText();
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
      child: Container(
        decoration: BoxDecoration(
          // color: fillColor,
          image: DecorationImage(
            image: AssetImage('lib/assets/rectangle.png'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            // Inner shadow effect
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff151316),
              Color(0xff161306),
              Color(0xff2B250B),
            ],
            stops: [0,0,0] ,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: _dateTimeController,
          decoration: InputDecoration(
            fillColor: ThemeColor.fieldbg,
            labelText: 'Date of Birth',
            prefixIcon: Icon(Icons.calendar_month_outlined),
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