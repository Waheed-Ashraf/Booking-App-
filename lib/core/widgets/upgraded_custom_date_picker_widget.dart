import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpgradedCustomDatePickerWidget extends StatefulWidget {
  const UpgradedCustomDatePickerWidget({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateChanged,
    this.textFieldBorderColor,
    this.textFieldHintStyle,
    this.textFieldStyle,
    this.suffixIcon,
  });

  final String? initialDate;
  final String? firstDate;
  final String? lastDate;
  final Function(String)? onDateChanged;
  final Color? textFieldBorderColor;
  final TextStyle? textFieldHintStyle;
  final TextStyle? textFieldStyle;
  final IconData? suffixIcon;

  @override
  State<UpgradedCustomDatePickerWidget> createState() =>
      _UpgradedCustomDatePickerWidgetState();
}

class _UpgradedCustomDatePickerWidgetState
    extends State<UpgradedCustomDatePickerWidget> {
  late TextEditingController _myController;
  late DateFormat _dateFormat;
  DateTime? _selectedDate;
  DateTime? _firstDate;
  DateTime? _lastDate;

  @override
  void initState() {
    super.initState();

    // Define the required date format
    _dateFormat = DateFormat('dd-MM-yyyy');

    // Parse the initial date, first date, and last date
    _selectedDate = _parseDate(widget.initialDate, fallback: DateTime.now());
    _firstDate = _parseDate(widget.firstDate, fallback: DateTime(1900));
    _lastDate = _parseDate(widget.lastDate, fallback: DateTime(2101));

    // Set the initial text in the controller
    _myController =
        TextEditingController(text: _dateFormat.format(_selectedDate!));
  }

  // Helper method to parse and format the date
  DateTime _parseDate(String? dateString, {required DateTime fallback}) {
    if (dateString == null) {
      return fallback;
    }

    // List of possible date formats to handle different input formats
    final possibleFormats = [
      DateFormat('dd-MM-yyyy'), // e.g., 02-08-2024
      DateFormat('yyyy-MM-dd'), // e.g., 2024-08-02
      DateFormat('MM/dd/yyyy'), // e.g., 08/02/2024
      DateFormat('dd/MM/yyyy'), // e.g., 02/08/2024
      DateFormat('dd MMMM yyyy'), // e.g., 02 August 2024
      DateFormat('MMMM dd, yyyy'), // e.g., August 02, 2024
      DateFormat('dd MMM yyyy'), // e.g., 02 Aug 2024
    ];

    for (var format in possibleFormats) {
      try {
        return format.parse(dateString);
      } catch (e) {
        // Ignore the error and try the next format
      }
    }

    // If all formats fail, return the fallback date
    return fallback;
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate!,
      firstDate: _firstDate!,
      lastDate: _lastDate!,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        String formattedDate = _dateFormat.format(picked);
        _myController.text = formattedDate;
        if (widget.onDateChanged != null) {
          widget.onDateChanged!(formattedDate);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
      controller: _myController,
      style: widget.textFieldStyle ??
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: _myController.text,
        hintStyle:
            widget.textFieldHintStyle ?? Theme.of(context).textTheme.bodySmall,
        suffixIcon: Icon(
          widget.suffixIcon ?? Icons.calendar_month,
          size: 24,
          color: Theme.of(context).primaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.textFieldBorderColor ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.textFieldBorderColor ?? Colors.blue,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
