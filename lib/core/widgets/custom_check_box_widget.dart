import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckboxWidget extends StatefulWidget {
  final String checkBoxDescription;
  bool? isChecked;

  CheckboxWidget(
      {super.key, required this.checkBoxDescription, this.isChecked});

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 1),
          value: widget.isChecked ?? false,
          onChanged: (bool? value) {
            setState(() {
              widget.isChecked = value!;
            });
          },
        ),
        Text(
          widget.checkBoxDescription,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
