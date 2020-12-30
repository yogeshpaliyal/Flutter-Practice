

class  StringHelper{
  static const _EMAIL_REGEX =  "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";

  static bool isValidEmail(String email){
    var _regex = RegExp(_EMAIL_REGEX);
    return _regex.hasMatch(email);
  }
}