import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInStates> {

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInCubit() : super(SignInInitial());

  static SignInCubit getCubit(BuildContext context)=>BlocProvider.of(context);



}
