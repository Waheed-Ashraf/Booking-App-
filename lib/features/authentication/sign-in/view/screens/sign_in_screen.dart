import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/custom_snack_bar.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view-model/sign_in_cubit.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/widgets/login_section.dart';
import 'package:booking_depi_proj/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {

  static const routeName = '/SignIn';
  final ScrollController scrollController = ScrollController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {

          if(state is SignInSuccessState){
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          }
          if(state is SignInFailureState){
            showSnackBar(context, color: redColor, message: state.failure.errMessage);
          }
        },
        builder: (context, state) {

          var cubit = SignInCubit.getCubit(context);

          return Stack(
            fit: StackFit.expand,
            children: [
              RadialGradientScaffold(
                  body: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: AppStyles.defaultPadding, vertical: MediaQuery
                        .of(context)
                        .padding
                        .top),

                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          127.verticalSpace,
                          Text(
                            'Welcome Back',
                            style: AppStyles.styleMedium24,
                          ),
                          10.verticalSpace,

                          Text(
                            'You can book an appointment, chat with doctors or even make a video call!',
                            textAlign: TextAlign.center,
                            style: AppStyles.styleLight14.copyWith(
                              color: Color(0xff677294),
                            ),
                          ),

                          LoginSection(
                            phoneController: cubit.phoneController,
                            passwordController: cubit.passwordController,
                            scrollController: scrollController,
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              if(state is SignInLoadingState)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
