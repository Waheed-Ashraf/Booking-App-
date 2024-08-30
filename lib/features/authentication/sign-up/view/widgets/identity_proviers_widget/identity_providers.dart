import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/assets.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/identity_proviers_widget/identity_provider_button.dart';
import 'package:flutter/material.dart';

class IdentityProviders extends StatelessWidget {
  const IdentityProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: AppStyles.defaultPadding * 2),
        child: Row(
          children: [
            Expanded(
              child: IdentityProviderButton(
                  imgPath: Assets.google,
                  identityProviderName: 'Google',
                  onPressed: () {}),
            ),
            AppStyles.defaultPadding.horizontalSpace,
            Expanded(
              child: IdentityProviderButton(
                  imgPath: Assets.facebook,
                  identityProviderName: 'Facebook',
                  onPressed: () {}),
            ),
          ],
        ));
  }
}
