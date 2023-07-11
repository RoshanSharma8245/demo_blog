import 'datamodel/content_details2.dart';
import 'datamodel/paywall_config.dart';

class Constants {
  static String? osVersion;
  static String? mobileModel;
  static String? osName;
  static String? userAgent;
  static int totalTime = 0;
  static int idleTimeSpent = 0;
  static int totalIdleTimeSpent = 0;
  static int pageLoad = 0;
  static int scrollDepth = 0;
  static bool? isPremium = false;
  static bool sessionExists = false;
  static String accessType = "";
  static int numOfCta = 1;
  static PaywallConfig paywallConfig = PaywallConfig();
  static ContentDetails2? contentDetails2;
  static String currencySymbol = "";
  static String contentPrice = "";
  static String passPrice = "";
  static String subscriptionPrice = "";
  static String? conscentBalance = "";
  static String? couponCode = "";
  static bool logIn = false;
  static String? paywallId = "";
  static String? authorName = "";
  static List<String>? tags;
}
