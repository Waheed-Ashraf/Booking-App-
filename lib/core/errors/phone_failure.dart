import 'package:booking_depi_proj/core/errors/failuer.dart';

final class PhoneParsingFailure extends Failure{
  PhoneParsingFailure(super.errMessage);

}

final class IncorrectSmsFailure extends Failure{

  IncorrectSmsFailure():super('The code is wrong, recheck your phone');
}

final class IncorrectPhoneOrPasswordFailure extends Failure{

  IncorrectPhoneOrPasswordFailure():super('Either Phone or Password is wrong!');
}

final class PhoneNotRegisteredFailure extends Failure{

  PhoneNotRegisteredFailure():super('Phone is not registered in our system!');
}