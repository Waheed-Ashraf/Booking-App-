import 'package:booking_depi_proj/core/errors/failuer.dart';

final class PhoneParsingFailure extends Failure{
  PhoneParsingFailure(super.errMessage);

}

final class IncorrectSmsFailure extends Failure{

  IncorrectSmsFailure():super('The code is wrong, recheck your phone');
}