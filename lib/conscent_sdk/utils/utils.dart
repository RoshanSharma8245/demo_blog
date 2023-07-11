import 'dart:ui';

class Utils {
  /// Example: your name => Your Name, your name => Your name
  static String capitalizeText(String value) {
    if (value == "") {
      return value;
    }
    return value.split(' ').map(capitalizeFirstText).join(' ');
  }

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  static String capitalizeFirstText(String s) {
    if (s == "") {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}

extension GetStringUtils on String {
  String get capitalizeText => Utils.capitalizeText(this);
}


StrokeCap getStrokeCap(String name){
  if(name == "dotted"){
    return StrokeCap.round;
  }
  return StrokeCap.square;
}

double getDashPattern(String name){
  if(name == "solid"){
    return 1;
  }
  return 25;
}
