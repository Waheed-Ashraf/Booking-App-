import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentityProviderButton extends StatelessWidget {

  final String imgPath;
  final String identityProviderName;
  final VoidCallback onPressed;

  const IdentityProviderButton({super.key, required this.imgPath, required this.identityProviderName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 54.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            width: 18.17.w,
            height: 18.17.h,
          ),
          12.horizontalSpace,
          Text(
            identityProviderName,
            style: AppStyles.styleLight16,
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.defaultBorderRadius),
      ),
      highlightColor: radialColor,
      splashColor: radialColor,
      padding: EdgeInsets.all(AppStyles.defaultPadding),
      minWidth: double.infinity,
      color: Colors.white,
      animationDuration: Duration(seconds: 1),
      elevation: 3,
      highlightElevation: .5,

    );
  }
}
