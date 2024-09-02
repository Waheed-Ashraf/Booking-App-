import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/assets.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/custom_snack_bar.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/view/identity_provider_button.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/view_model/identity_providers_cubit.dart';
import 'package:booking_depi_proj/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IdentityProviders extends StatelessWidget {
  const IdentityProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IdentityProvidersCubit(),
      child: BlocConsumer<IdentityProvidersCubit, IdentityProvidersStates>(
        listener: (context, state) {
          if (state is IdentityProvidersSuccessSignState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              HomeScreen.routeName,
              (route) => false,
            );
          }
          if (state is IdentityProvidersFailureSignState) {
            showSnackBar(context,
                color: redColor, message: state.failure.errMessage);
          }
        },
        builder: (context, state) {
          var cubit = IdentityProvidersCubit.getCubit(context);

          return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AppStyles.defaultPadding * 2),
              child: Row(
                children: [
                  Expanded(
                    child: IdentityProviderButton(
                        imgPath: Assets.google,
                        identityProviderName: 'Google',
                        onPressed: () {
                          cubit.signInWithGoogle();
                        }),
                  ),
                  AppStyles.defaultPadding.horizontalSpace,
                  Expanded(
                    child: IdentityProviderButton(
                        imgPath: Assets.facebook,
                        identityProviderName: 'Facebook',
                        onPressed: () {
                          cubit.signInWithFacebook();
                        }),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
