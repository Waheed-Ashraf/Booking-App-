import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacers on num{

  Widget get verticalSpace=>SizedBox(height: this.h,);
  Widget get horizontalSpace=>SizedBox(width: this.w,);
}