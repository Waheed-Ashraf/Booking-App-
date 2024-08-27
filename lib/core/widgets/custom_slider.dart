// import 'package:clinic_engine_admin_project/core/utils/app_styles.dart';
// import 'package:clinic_engine_admin_project/core/utils/constent_colors.dart';
// import 'package:clinic_engine_admin_project/core/widgets/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomItemSlider extends StatefulWidget {
//   final String hintText;
//   final List<DropdownMenuItem<String>> items;
//   final void Function(String?)? onChanged;
//   const CustomItemSlider({
//     this.onChanged,
//     super.key,
//     required this.hintText,
//     required this.items,
//   });

//   @override
//   State<CustomItemSlider> createState() => _CustomItemSliderState();
// }

// class _CustomItemSliderState extends State<CustomItemSlider> {
//   String? _selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey),
//         color: Colors.white,
//       ),
//       child: DropdownButton(
//         value: _selectedItem,
//         hint:
//             Text(widget.hintText, style: const TextStyle(color: primaryColor)),
//         icon: const Padding(
//           padding: EdgeInsets.only(left: 8),
//           child: Icon(Icons.keyboard_arrow_down, color: primaryColor),
//         ),
//         iconSize: 30.r,
//         elevation: 16,
//         style: AppStyles.styleRegular12.copyWith(color: primaryColor),
//         underline: Container(),
//         onChanged: (String? newValue) {
//           setState(() {
//             _selectedItem = newValue;
//           });
//         },
//         items: widget.items,
//       ),
//     );
//   }
// }
