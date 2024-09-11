part of 'sign_in_cubit.dart';

@immutable
sealed class SignInStates {}

final class SignInInitial extends SignInStates {}

// Sign in states

final class SignInLoadingState extends SignInStates{}

final class SignInFailureState extends SignInStates{
  final Failure failure;

  SignInFailureState({required this.failure});
}

final class SignInSuccessState extends SignInStates{}

// forget password states

final class WannaEnterPhoneInForgottenPassword extends SignInStates{}

final class ForgetPasswordPhoneRegisteredState extends SignInStates{}

final class ForgetPasswordShowChangePasswordState extends SignInStates{}

final class  ForgetPasswordSuccessfullyReset extends SignInStates{}