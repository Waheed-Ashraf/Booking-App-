part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpStates {}

final class SignUpInitial extends SignUpStates {}

final class SignUpAgreeOnTermsChanged extends SignUpStates {}


final class SignUpUserDidNotAgreedOnTerms extends SignUpStates {}

final class SignUpVerificationFailureState extends SignUpStates{
  final Failure failure;

  SignUpVerificationFailureState({required this.failure});
}

final class SignUpShowCodeBottomSheetState extends SignUpStates{}

final class SignUpLoadingState extends SignUpStates{}

final class SignUpSuccessState extends SignUpStates{}

