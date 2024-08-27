import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class CustomDatePickerWidget extends StatefulWidget {
  const CustomDatePickerWidget({
    super.key,
  });

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  late final TextEditingController _myController;
  @override
  void initState() {
    _myController = TextEditingController();
    _myController.text = DateTime.now().toString().split(" ")[0];
    super.initState();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _myController.text = picked.toString().split(" ")[0];
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
      style: Theme.of(context)
          .textTheme
          .bodyMedium // Uses custom global text style
          !
          .copyWith(
            color: primaryColor,
          ),
      decoration: InputDecoration(
        hintText: _myController.text,
        suffixIconColor: primaryColor,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall, // Uses custom global text style

        suffixIcon: const Icon(
          Icons.calendar_month,
          size: 24,
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: textFieldBorderGrayColor,
      ),
      borderRadius: BorderRadius.circular(
        8,
      ),
    );
  }
}
