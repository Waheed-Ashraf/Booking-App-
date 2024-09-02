
final class FieldValidator{

  static String? internationalPhoneValidator(String? phone){
    if(phone == null || phone.isEmpty ) {
      return 'Please, Enter your phone number';
    }
    RegExp internationalPhoneRegExp = RegExp(r'^(\+?\d{1,4}[\s.-]?)?(\(?\d{1,4}\)?[\s.-]?)?[\d\s.-]{7,13}$');
    return internationalPhoneRegExp.hasMatch(phone) ? null : 'This is not a valid Phone Number';
  }

  static String? nameValidator(String? name){
    if(name == null || name.isEmpty ) {
      return 'Please, Enter your Name';
    }
    if(containsNumbers(name)){
      return 'Please, do not use numbers in your name';
    }
    if(name.split(' ').length > 4){
      return 'Too Long Name';
    }
    return null;
  }

  static String? passwordValidator(String? password){
    if(password != null && password.isNotEmpty){
      if(password.length < 6){
        return 'Too Short password';
      }
        if(!isMixOfCharsAndNumbers(password)){

          return 'Use Letters and numbers in password';
        }
        return null;
    }
    return 'Pleas, Write your password ';
  }

  static bool containsNumbers(String name){
    for(int c = 0 ; c<name.length ; c++){
      if(int.tryParse(name[c]) != null){
        return true;
      }
    }
    return false;
  }

  static bool isMixOfCharsAndNumbers(String any){
    bool containsNumbers = false;
    bool containsChars = false;

    for(int c = 0 ; c < any.length ; c++){

      if(int.tryParse(any[c]) == null){
        containsChars = true;
      }
      else{
        containsNumbers = true;
      }
    }
    return (containsChars && containsNumbers);
  }

}