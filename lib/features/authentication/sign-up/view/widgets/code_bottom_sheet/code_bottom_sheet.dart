import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view-model/sign_up_cubit.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/code_bottom_sheet/code_text_field.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/code_bottom_sheet/sheet_dragging_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeBottomSheet extends StatelessWidget {

  final List<TextEditingController> codeControllers = List.generate(6, (index)=>TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpStates>(

  builder: (context, state) {
    var cubit = SignUpCubit.getCubit(context);

    return Container(
      padding: EdgeInsets.all(AppStyles.defaultPadding),
      height: context.height / 2.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[radialColor, Colors.white], stops: [.15,1], begin: Alignment.topCenter, end:  Alignment.bottomCenter),
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppStyles.defaultPadding)),
      ),
        child: Column(
          children: [
           // const SheetDraggingContainer(),
            //30.verticalSpace,

            Text(
                'Enter 6 Digits Code',
              style: AppStyles.styleMedium24,
            ),

            15.verticalSpace,

            Text(
              'Enter the 6 digits code you just received on SMS',
              style: AppStyles.styleRegular14.copyWith(
                color: grayTextColor,
              ),
            ),

            Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [

                      Expanded(
                        child: Row(
                          children: [
                            ...List.generate(5, (index)=>Expanded(child: CodeTextField(controller: codeControllers[index],))),
                            Expanded(child: CodeTextField(controller: codeControllers[codeControllers.length-1],textInputAction: TextInputAction.done,)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [

                            Expanded(
                              child: CustomFilledButton(text: 'Resend Code', onPressed: (){

                              }),
                            ),
                            AppStyles.defaultPadding.horizontalSpace,
                            Expanded(
                              child: CustomFilledButton(text: 'Sign up', onPressed: (){
                                if(formKey.currentState!.validate()){
                                  cubit.setSmsCodeAndSignUp(codeControllers);
                                }
                              }),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                )
            ),
          ],
        )
    );
  },
);
  }
}
