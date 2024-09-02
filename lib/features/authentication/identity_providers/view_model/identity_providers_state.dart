part of 'identity_providers_cubit.dart';

@immutable
sealed class IdentityProvidersStates {}

final class IdentityProvidersInitial extends IdentityProvidersStates {}

final class IdentityProvidersFailureSignState extends IdentityProvidersStates{
  final Failure failure;

  IdentityProvidersFailureSignState({required this.failure});
}

final class IdentityProvidersSuccessSignState extends IdentityProvidersStates{}

