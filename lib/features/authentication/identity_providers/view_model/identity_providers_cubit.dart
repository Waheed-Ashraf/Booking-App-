import 'package:bloc/bloc.dart';
import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/data/Identity_signing_repo/id_providers_sign_repo.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/data/identity_signing_service/facebook_signing_service.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/data/identity_signing_service/google_signing_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'identity_providers_state.dart';

class IdentityProvidersCubit extends Cubit<IdentityProvidersStates> {
  late final BaseIdentityProvidersSigningRepo _signingRepo;

  IdentityProvidersCubit() : super(IdentityProvidersInitial()) {
    _signingRepo = IdentityProvidersSigningRepo();
  }

  static IdentityProvidersCubit getCubit(BuildContext context) =>
      BlocProvider.of(context);

  void signInWithGoogle() async {
       await _signingRepo.signInWithGoogle(googleService: GoogleSignInService());
       emit(IdentityProvidersSuccessSignState());

    // try {
    //   await _signingRepo.signInWithGoogle(googleService: GoogleSignInService());
    //   emit(IdentityProvidersSuccessSignState());
    // } on Failure catch (failure) {
    //   emit(IdentityProvidersFailureSignState(failure: failure));
    // } catch (e) {
    //   emit(IdentityProvidersFailureSignState(
    //       failure: UnknownFailure(
    //           'Failed Signing you up with google! really have an account!!')));
    // }
  }

  void signInWithFacebook()async {

    await _signingRepo.signInWithFacebook(facebookService: FacebookSignInService());
    emit(IdentityProvidersSuccessSignState());
    // try {
    //   await _signingRepo.signInWithFacebook(facebookService: FacebookSignInService());
    //   emit(IdentityProvidersSuccessSignState());
    // } on Failure catch (failure) {
    //   emit(IdentityProvidersFailureSignState(failure: failure));
    // } catch (e) {
    //   emit(IdentityProvidersFailureSignState(
    //       failure: UnknownFailure(
    //           'Failed Signing you up with facebook! really have an account!!')));
    // }
  }

}
