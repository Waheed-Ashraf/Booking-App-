part of 'sign_in_cubit.dart';

@immutable
sealed class SignInStates {}

final class SignInInitial extends SignInStates {}

final class SignInLoadingState extends SignInStates{}

final class SignInFailureState extends SignInStates{
  final Failure failure;

  SignInFailureState({required this.failure});
}

final class SignInSuccessState extends SignInStates{}
