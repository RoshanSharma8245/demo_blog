import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:demo_blog/conscent_sdk/paywalls/flutter_flow/flutter_flow_util.dart';
import 'package:demo_blog/conscent_sdk/paywalls/in_article_8_a_1_c_t_a/in_article8_a1_c_t_a_widget.dart';
import 'package:demo_blog/conscent_sdk/paywalls/inarticle_5_a_3_c_t_a/inarticle5_a3_c_t_a_widget.dart';
import 'package:demo_blog/conscent_sdk/paywalls/inarticle_7_a_1_c_t_a/inarticle7_a1_c_t_a_widget.dart';
import 'package:demo_blog/conscent_sdk/paywalls/inarticle_8_a_2_c_t_a/inarticle8_a2_c_t_a_widget.dart';
import 'package:demo_blog/conscent_sdk/paywalls/paywall_3A/paywall_3A.dart';
import 'package:device_info/device_info.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'conscent_initializer.dart';
import 'constants.dart';
import 'coreDb.dart';
import 'datamodel/api_mode.dart';
import 'datamodel/content_access_model.dart';
import 'datamodel/content_details2.dart';
import 'datamodel/getuser_detail.dart';
import 'datamodel/journey_response.dart';
import 'datamodel/login_challenge_post.dart';
import 'datamodel/login_challengeget.dart';
import 'datamodel/logout.dart';
import 'datamodel/page_view_event.dart';
import 'datamodel/paywall_click_event.dart';
import 'datamodel/paywall_config.dart';
import 'datamodel/paywall_view_event.dart';
import 'datamodel/ping.dart';
import 'datamodel/subscription_access_model.dart';

var _messageBodyData = MessageBody();
var _messageBodyDataEvent = MessageBodyEvent();
var _messageBodyPageView = PageViewMessageBody();
bool _pageLoadEnabled = false;
bool _scrollDepthEnable = false;

class ConscentMethods {
  static double onScollDepth = 0;
  static double height = 0;
  int _counter = 1;
  static bool _status = true;
  bool? status;

  void setScollDepthHeight(double onScollDepth, double height) {
    ConscentMethods.onScollDepth = onScollDepth;
    ConscentMethods.height = height;
  }

  Future<JourneyResponse?> getJourneyResponse() async {
    var anonId = await CoreDb.instance().getAnonId();
    anonId ??= const Uuid().v4();
    var userId = await CoreDb.instance().getUserId();
    await CoreDb.instance().setAnonId(anonId);
    var sessionId = await CoreDb.instance().getSessionId();

    sessionId ??= "";
    userId ??= "";

    String operatingSystem = "";
    if (Platform.isIOS) {
      operatingSystem = "IOS";
    } else {
      operatingSystem = "ANDROID";
    }
    var url = Uri.parse(
        '${APIMode.BASE_URL}api/v1/journey?clientId=${ConscentInitializer.mClientId}&anonId=$anonId&adBlock=false&cookies=0&clientContentId=${ConscentInitializer.mContentId}&sessionId=$sessionId&device=application&operatingSystem=$operatingSystem&browser=WEBVIEW&userId=$userId');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      JourneyResponse journeyResponse =
          JourneyResponse.fromJson(json.decode(response.body));
      return journeyResponse;
    } else {
      onPluginError(response.body);
    }
    return null;
  }

  ContentAccessModel? contentAccessModel;

  String? loginId;

  Future<bool> getContentAccess() async {
    var loginId = await CoreDb.instance().getLoginId();
    if (loginId == null) {
      LoginChallengepost loginChallengepost = await _createLogInChallenge();

      loginId = loginChallengepost.loginChallengeId;
    }
    JourneyResponse? journeyResponse = await getJourneyResponse();
    if (journeyResponse?.actionId?.data?.actionId != null) {
      Constants.paywallId = journeyResponse?.actionId?.data?.actionId!;
    }
    String? signature = journeyResponse?.signature;

    int? pageLoad =
        journeyResponse?.actionId?.data?.conditions?.mobilePageLoad?.value;
    if (journeyResponse?.actionId?.data?.conditions?.mobilePageLoad?.enabled ==
        true) {
      _pageLoadEnabled = true;
    } else {
      _pageLoadEnabled = false;
    }
    int? scrollDepth =
        journeyResponse?.actionId?.data?.conditions?.mobileScrollDepth?.value;
    if (journeyResponse
            ?.actionId?.data?.conditions?.mobileScrollDepth?.enabled ==
        true) {
      _scrollDepthEnable = true;
    } else {
      _scrollDepthEnable = false;
    }
    pageLoad ??= 0;
    scrollDepth ??= 0;
    Constants.pageLoad = pageLoad;
    Constants.scrollDepth = scrollDepth;
    Constants.authorName = journeyResponse?.content?.authorName;
    Constants.tags = journeyResponse?.content?.tags;
    Constants.isPremium = journeyResponse?.isPremium;

    if (journeyResponse?.unlockedWithPass == true) {
      Constants.accessType = "PASS";
    } else if (journeyResponse?.unlockedWithSubscription == true) {
      Constants.accessType = "SUBS";
    } else if (journeyResponse?.freeAccess == true &&
        journeyResponse?.isPremium == true) {
      Constants.accessType = "UJF";
    } else if (journeyResponse?.unlockedWithPass == false &&
        journeyResponse?.unlockedWithSubscription == false &&
        journeyResponse?.sessionExists == true) {
      Constants.accessType = "CONTENT";
    }

    if (journeyResponse?.sessionExists == true) {
      Constants.sessionExists = true;
    } else {
      Constants.sessionExists = false;
    }

    pageViewEvent(journeyResponse);

    if (signature != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _getPaywallDetails() async {
    String? userId = await CoreDb.instance().getUserId();
    if (userId != null && userId.isNotEmpty) {
      Constants.logIn = true;
    }
    String? sessionId = await CoreDb.instance().getSessionId();
    var url = Uri.parse(
        '${APIMode.BASE_URL}api/v1/content?clientId=${ConscentInitializer.mClientId}&clientContentId=${ConscentInitializer.mContentId}&sessionId=$sessionId');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      ContentDetails2 contentDetails2 =
          ContentDetails2.fromJson(json.decode(response.body));
      Constants.contentDetails2 = contentDetails2;
      Constants.contentDetails2?.couponForPass?.code = "";
      Constants.conscentBalance =
          contentDetails2.userDetails?.wallet?.balance?.numberDecimal;
    } else {
      onPluginError(response.body);
    }
  }

  Future<String> prepareAutoLoginUrl(List<String?> append) async {
    String redirectUrl = "";

    String? loginChallengeId = await CoreDb.instance().getLoginId();
    if (loginChallengeId == null || loginChallengeId == "") {
      LoginChallengepost loginChallengepost = await _createLogInChallenge();
      loginChallengeId = loginChallengepost.loginChallengeId;

      await CoreDb.instance().setLoginId(loginChallengeId);
    }

    redirectUrl =
        "${APIMode.SERVICE_BASE_URL}/auto-login-user?id=${append[0]}&clientId=${ConscentInitializer.mClientId}&phone=${append[1]}&email=${append[2]}&loginChallengeId=$loginChallengeId";
    return redirectUrl;
  }

  Future<String> prepareLoginChallenge(List<String> append) async {
    String redirectUrl;
    String? subscriptionUrl;
    String? subscriptionDomain = "";

    subscriptionUrl = Constants.contentDetails2?.subscriptionUrl;
    subscriptionDomain = Constants.contentDetails2?.subscriptionDomain;
    await CoreDb.instance().setSubsUrl(subscriptionUrl!);

    String? loginChallengeId = await CoreDb.instance().getLoginId();
    if (loginChallengeId == null && loginChallengeId == "") {
      LoginChallengepost loginChallengepost = await _createLogInChallenge();
      loginChallengeId = loginChallengepost.loginChallengeId;

      await CoreDb.instance().setLoginId(loginChallengeId);
    }
    var anonId = await CoreDb.instance().getAnonId();
    if (Constants.paywallConfig.data?.sId == "default") {
      Constants.paywallConfig.data?.sId = "";
    }
    if (append.first == "content") {
      redirectUrl =
          '${APIMode.SERVICE_BASE_URL}/overlay?clientId=${ConscentInitializer.mClientId}&clientContentId=${ConscentInitializer.mContentId}&loginChallenge=$loginChallengeId&anonId=$anonId&paywallId=${Constants.paywallConfig.data?.sId}';
      return redirectUrl;
    } else if (append.first == "pass") {
      redirectUrl =
          '${APIMode.SERVICE_BASE_URL}/overlay?clientId=${ConscentInitializer.mClientId}&clientContentId=${ConscentInitializer.mContentId}&loginChallenge=$loginChallengeId&purchaseMode=PASS&anonId=$anonId&paywallId=${Constants.paywallConfig.data?.sId}';
      return redirectUrl;
    } else if (append.first == "subscription") {
      redirectUrl =
          'https://$subscriptionDomain/${append.last}?clientId=${ConscentInitializer.mClientId}&clientContentId=${ConscentInitializer.mContentId}&loginChallenge=$loginChallengeId&anonId=$anonId&paywallId=${Constants.paywallConfig.data?.sId}';

      return redirectUrl;
    } else {
      redirectUrl =
          '${APIMode.SERVICE_BASE_URL}/overlay?clientId=${ConscentInitializer.mClientId}&clientContentId=${ConscentInitializer.mContentId}&loginChallenge=$loginChallengeId&anonId=$anonId&paywallId=${Constants.paywallConfig.data?.sId}';
      return redirectUrl;
    }
  }

  Future<LoginChallengepost> _createLogInChallenge() async {
    var response = await http
        .post(Uri.parse('${APIMode.BASE_URL}api/v1/login-challenge'), body: {
      "loginChallengeId":
          '${DateTime.now().millisecondsSinceEpoch.toString()}${const Uuid().v4()}',
      "redirectTo": ""
    });

    if (response.statusCode == 201) {
      var responseString = response.body;
      String loginChallengeId =
          loginChallengepostFromJson(responseString).loginChallengeId;

      await CoreDb.instance().setLoginId(loginChallengeId);

      return loginChallengepostFromJson(responseString);
    } else {
      onPluginError(response.body);
      throw Exception('Failed to create album.');
    }
  }

  // methods for subscription
  Future<SubscriptionAccess?> geSubscriptionAccess() async {
    loginId = await CoreDb.instance().getLoginId();

    var responDtta = await getSessionIDForSubs(loginId.toString());
    return responDtta;
  }

  Future<SubscriptionAccess?> getSessionIDForSubs(String loginId) async {
    var uri = Uri.parse('${APIMode.BASE_URL}api/v1/login-challenge/$loginId');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      LoginChallengeget loginChallengeget =
          loginChallengegetFromJson(response.body);

      String sessionId = loginChallengeget.sessionId.toString();
      await CoreDb.instance().setSessionId(sessionId);
      var responseDta = await getPstssForSubs();
      return responseDta;
    } else {
      onPluginError(response.body);
      return null;
    }
  }

  Future<SubscriptionAccess?> getPstssForSubs() async {
    var sessionIds = await CoreDb.instance().getSessionId();
    var uri = Uri.parse(
        '${APIMode.BASE_URL}api/v1/subscription/access?sessionId=$sessionIds&clientId=${ConscentInitializer.mClientId}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var subscriptionAccess =
          SubscriptionAccess.fromJson(jsonDecode(response.body));

      return subscriptionAccess;
    } else {
      onPluginError(response.body);
      return null;
    }
  }

  Future<String?> userLogOut() async {
    String? sessionId = await CoreDb.instance().getSessionId();
    Constants.logIn = false;

    sessionId ??= "";

    String? logout;
    var response = await http.post(
        Uri.parse(
            '${APIMode.BASE_URL}api/v1/auth/logout-via-sessionid?sessionId=$sessionId'),
        body: {
          "sessionId": sessionId,
        });

    if (response.statusCode == 201) {
      logout = logoutFromJson(response.body).message;
    } else {
      onPluginError(response.body);
      logout = logoutFromJson(response.body).error;
    }
    CoreDb.instance().deleteSessionId();
    CoreDb.instance().deleteAnonId();
    CoreDb.instance().deleteSubsUrl();
    CoreDb.instance().deleteUserType();
    CoreDb.instance().deleteLoginId();
    CoreDb.instance().deleteUserId();

    return logout;
  }

  Future<GetUserDetail?> getUser() async {
    GetUserDetail? getUserDetail;

    String? sessionId = await CoreDb.instance().getSessionId();

    var uri = Uri.parse(
        '${APIMode.BASE_URL}api/v1/user/$sessionId?clientId=${ConscentInitializer.mClientId}');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      getUserDetail = GetUserDetail.fromJson(jsonDecode(response.body));
      return getUserDetail;
    } else {
      onPluginError(response.body);
    }
    return getUserDetail;
  }

  Future<PaywallConfig> getPaywallConfig() async {
    await ConscentMethods()._getPaywallDetails();
    PaywallConfig paywallConfig = PaywallConfig();

    var uri = Uri.parse(
        '${APIMode.BASE_URL}api/v1/paywall/paywall-config/${ConscentInitializer.mClientId}?paywallId=${Constants.paywallId}');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      paywallConfig = PaywallConfig.fromJson(jsonDecode(response.body));
      print("paywallConfig ${paywallConfig.toJson()}");
      return paywallConfig;
    } else {
      onPluginError(response.body);
    }

    return paywallConfig;
  }

  Future<void> getOSVersion() async {
    await FkUserAgent.init();
    Constants.userAgent = FkUserAgent.webViewUserAgent;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      Constants.osVersion = androidInfo.version.release;
      Constants.mobileModel = androidInfo.model;
      Constants.osName = "Android";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

      Constants.osVersion = iosDeviceInfo.systemVersion;
      Constants.mobileModel = iosDeviceInfo.model;
      Constants.osName = "Iphone";
    }
  }

  // Paywall View Event
  Future<void> paywallViewEvent() async {
    await ConscentMethods().getOSVersion();
    var anonId = await CoreDb.instance().getAnonId();

    anonId ??= const Uuid().v4();
    await CoreDb.instance().setAnonId(anonId);

    _messageBodyData.clientId = ConscentInitializer.mClientId;
    _messageBodyData.contentId = ConscentInitializer.mContentId;
    _messageBodyData.anonId = anonId;
    _messageBodyData.userId = await CoreDb.instance().getUserId();

    _messageBodyData.deviceType = "Mobile";
    _messageBodyData.eventLocation = "PAYWALL";
    _messageBodyData.eventType = "VIEW";
    _messageBodyData.paywallDisplayType = "INARTICLE";
    _messageBodyData.isCookieBlocked = 0;
    _messageBodyData.numOfCta = Constants.numOfCta;

    if (Constants.paywallConfig.data != null) {
      _messageBodyData.paywallId = Constants.paywallConfig.data?.sId;
      _messageBodyData.numOfCta = Constants
          .paywallConfig.data?.configuration?.mobile?.templateId?.numberOfCta;
      _messageBodyData.paywallType = Constants
          .paywallConfig.data?.configuration?.mobile?.templateId?.paywallType;
      _messageBodyData.paywallDisplayType = Constants
          .paywallConfig.data?.configuration?.mobile?.templateId?.displayType;
    }

    _messageBodyData.osVersion = Constants.osVersion;
    _messageBodyData.mobileModel = Constants.mobileModel;
    _messageBodyData.osName = Constants.osName;
    _messageBodyData.userAgent = Constants.userAgent;

    var paywallViewEvent = PaywallViewEvent(messageBody: [_messageBodyData]);
    paywallViewEvent.topic = "demoTopic";

    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = paywallViewEvent.toJson();
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    var response = await http.post(
      Uri.parse('${APIMode.EVENT_BASE_URL}/collect/event'),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
    } else {
      onPluginError("${response.body} ${APIMode.EVENT_BASE_URL}/collect/event");
    }

    print("paywallViewEvent $jsonBody");
  }

  //Click Event

  Future<void> paywallClickEvent(String clickAction) async {
    pageExitEvent();
    await ConscentMethods().getOSVersion();
    var anonId = await CoreDb.instance().getAnonId();
    anonId ??= const Uuid().v4();

    _messageBodyDataEvent.clientId = ConscentInitializer.mClientId;
    _messageBodyDataEvent.contentId = ConscentInitializer.mContentId;
    _messageBodyDataEvent.anonId = anonId;
    _messageBodyDataEvent.userId = await CoreDb.instance().getUserId();

    _messageBodyDataEvent.deviceType = "MOBILE";
    _messageBodyDataEvent.isCookieBlocked = 0;

    _messageBodyDataEvent.paywallDisplayType = Constants
        .paywallConfig.data?.configuration?.mobile?.templateId?.displayType;
    _messageBodyDataEvent.numOfCta = Constants.numOfCta;

    if (Constants.paywallConfig.data != null) {
      _messageBodyDataEvent.paywallId = Constants.paywallConfig.data?.sId;
      _messageBodyDataEvent.numOfCta = Constants
          .paywallConfig.data?.configuration?.mobile?.templateId?.numberOfCta;
      _messageBodyDataEvent.paywallType = Constants
          .paywallConfig.data?.configuration?.mobile?.templateId?.paywallType;
      _messageBodyDataEvent.paywallDisplayType = Constants
          .paywallConfig.data?.configuration?.mobile?.templateId?.displayType;
    }
    _messageBodyDataEvent.osVersion = Constants.osVersion;
    _messageBodyDataEvent.mobileModel = Constants.mobileModel;
    _messageBodyDataEvent.osName = Constants.osName;
    _messageBodyDataEvent.userAgent = Constants.userAgent;
    _messageBodyDataEvent.clickAction = clickAction;
    _messageBodyDataEvent.eventLocation = "PAYWALL";
    _messageBodyDataEvent.eventType = "CLICK";
    var paywallViewClickEvent =
        PaywallClickEvent(messageBody: [_messageBodyDataEvent]);
    paywallViewClickEvent.topic = "demoTopic";
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = paywallViewClickEvent.toJson();
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    var response = await http.post(
      Uri.parse('${APIMode.EVENT_BASE_URL}/collect/event'),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    if (response.statusCode == 200) {
    } else {
      onPluginError("${response.body} ${APIMode.EVENT_BASE_URL}/collect/event");
    }
  }

  void onTouchListener() {
    ConscentMethods._status = true;
  }

  static Timer? _timer15;

  Future<void> pageExitEvent() async {
    _messageBodyPageView.eventType = "EXIT";
    _messageBodyPageView.userId = await CoreDb.instance().getUserId();

    _timer15?.cancel();

    var paywallViewExitEvent =
        PageViewEvent(PageViewmessageBody: [_messageBodyPageView]);

    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = paywallViewExitEvent.toJson();
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    var response = await http.post(
      Uri.parse('${APIMode.EVENT_BASE_URL}/collect/event'),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    print("paywallViewExitEvent $jsonBody");

    if (response.statusCode == 200) {
    } else {
      onPluginError(
          "${response.body} ${APIMode.EVENT_BASE_URL}/collect/event   @PageViewExitEvent");
    }
  }

  Future<void> pingEvent(JourneyResponse? journeyResponse) async {
    var pingMessageBody = PingMessageBody();

    status;
    String? pingId;
    if (status == null) {
      pingId = const Uuid().v4();
      await CoreDb.instance().setPingId(pingId);
    } else if (status != _status) {
      _counter = 1;
      pingId = const Uuid().v4();
      await CoreDb.instance().setPingId(pingId);
    } else if (status == _status) {
      pingId = await CoreDb.instance().getPingId();
    }

    pingMessageBody.pingId = pingId;
    pingMessageBody.active = _status;
    pingMessageBody.counter = _counter;
    pingMessageBody.anonId = await CoreDb.instance().getAnonId();
    pingMessageBody.userId = await CoreDb.instance().getUserId();
    pingMessageBody.clientId = '${ConscentInitializer.mClientId}';
    pingMessageBody.contentId = '${ConscentInitializer.mContentId}';
    pingMessageBody.authorName = Constants.authorName;
    pingMessageBody.contentTags = journeyResponse?.content?.tags;
    pingMessageBody.contentTitle = journeyResponse?.content?.title;
    pingMessageBody.contentCategories = journeyResponse?.content?.categories;
    pingMessageBody.contentSections = journeyResponse?.content?.sections;

    _counter++;
    status = _status;
    _status = false;

    var ping = Ping(messageBody: [pingMessageBody]);

    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = ping.toJson();
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    var response = await http.post(
      Uri.parse('${APIMode.EVENT_BASE_URL}/collect/event'),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    print("PingEvent $jsonBody");

    if (response.statusCode == 200) {
    } else {
      onPluginError(
          "${response.body} ${APIMode.EVENT_BASE_URL}/collect/event   @PingEvent");
    }
  }

  Future<void> pageViewEvent(JourneyResponse? journeyResponse) async {
    await ConscentMethods().getOSVersion();

    _timer15 = Timer.periodic(const Duration(seconds: 15), (timer) async {
      if (_status) {
        await pingEvent(journeyResponse);
      } else if (_counter <= 12 || _status) {
        await pingEvent(journeyResponse);
      }
    });
    String? anonId = await CoreDb.instance().getAnonId();
    var userType = await CoreDb.instance().getUserType();
    userType ??= "NEW";

    if (anonId == null) {
      anonId = const Uuid().v4();
      await CoreDb.instance().setAnonId(anonId);
    }

    _messageBodyPageView.anonId = anonId;
    _messageBodyPageView.eventType = "VIEW";
    _messageBodyPageView.eventLocation = "PAGE";
    _messageBodyPageView.deviceType = 'MOBILE';
    _messageBodyPageView.pageType = "APP";
    _messageBodyPageView.mobileModel = Constants.mobileModel;
    _messageBodyPageView.osVersion = Constants.osVersion;
    _messageBodyPageView.userType = userType;
    _messageBodyPageView.scrollDepth = onScollDepth.toInt();
    _messageBodyPageView.pageLength = height.toInt();
    _messageBodyPageView.clientId = '${ConscentInitializer.mClientId}';
    _messageBodyPageView.contentId = '${ConscentInitializer.mContentId}';

    _messageBodyPageView.premiumContent = journeyResponse?.isPremium;
    _messageBodyPageView.unlockedStatus = Constants.sessionExists;
    _messageBodyPageView.accessType = Constants.accessType;
    _messageBodyPageView.osName = Constants.osName;
    _messageBodyPageView.userAgent = Constants.userAgent;
    _messageBodyPageView.userId = await CoreDb.instance().getUserId();
    _messageBodyPageView.authorName = journeyResponse?.content?.authorName;
    _messageBodyPageView.contentTags = journeyResponse?.content?.tags;
    _messageBodyPageView.contentTitle = journeyResponse?.content?.title;
    _messageBodyPageView.contentSections = journeyResponse?.content?.sections;
    _messageBodyPageView.contentCategories =
        journeyResponse?.content?.categories;
    _messageBodyPageView.url = journeyResponse?.content?.url;

    await CoreDb.instance().setUserType("REPEAT");

    var paywallViewEvent =
        PageViewEvent(PageViewmessageBody: [_messageBodyPageView]);

    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = paywallViewEvent.toJson();
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    var response = await http.post(
      Uri.parse('${APIMode.EVENT_BASE_URL}/collect/event'),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    print("pageViewEvent $jsonBody");

    if (response.statusCode == 200) {
    } else {
      onPluginError(
          "${response.body} ${APIMode.EVENT_BASE_URL}/collect/event   @PageViewEvent");
    }
  }

  void onPluginError(String error) {
    debugPrint('onPluginError: $error');
  }
}

@immutable
class Paywall extends StatefulWidget {
  Function(bool) sessionCallback;

  Paywall(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  _Paywall createState() => _Paywall();
}

class _Paywall extends State<Paywall> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = true;

  Timer? timer2;

  @override
  void initState() {
    super.initState();
    if (_scrollDepthEnable) {
      timer2 = Timer.periodic(
          const Duration(seconds: 1),
          (Timer t) => setState(() {
                ConscentMethods.onScollDepth;
              }));
    }

    if (_pageLoadEnabled) {
      Future.delayed(Duration(seconds: Constants.pageLoad), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    timer2?.cancel();
    ConscentMethods.onScollDepth = 0;
    ConscentMethods.height = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      timer2?.cancel();
      return getPaywall();
    } else if (Constants.scrollDepth < ConscentMethods.onScollDepth) {
      timer2?.cancel();
      return getPaywall();
    } else {
      return getPaywall();
    }
  }

  Widget getPaywall() {
    return GestureDetector(
      // onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: FutureBuilder<PaywallConfig>(
            future: ConscentMethods().getPaywallConfig(),
            builder: (context, AsyncSnapshot<PaywallConfig> snapshot) {
              // Customize what your widget looks like when it's loading.

              if (snapshot.hasData) {
                Constants.paywallConfig = snapshot.data!;
                final paywallconfigResponse = snapshot.data!;

                String? contentDivBtnValue = "";
                String? passDivBtn = "";
                String? subDivBtn = "";
                String? radioBtnOne = "";
                String? radioBtnTwo = "";
                String? radioBtnThree = "";

                contentDivBtnValue = Constants.paywallConfig.data?.configuration
                    ?.mobile?.json?.slotData?.slot?.contentDivBtn?.value;

                Constants.contentPrice = "";
                Constants.passPrice = "";
                Constants.subscriptionPrice = "";

                // content price
                if (contentDivBtnValue == "content") {
                  Constants.contentPrice = valueOrDefault<String>(
                    "${Constants.contentDetails2?.microPricing?.price.toString()}",
                    "",
                  );
                } else if (contentDivBtnValue == "pass") {
                  Constants.contentPrice = valueOrDefault<String>(
                    "${Constants.contentDetails2?.validPass?.price.toString()}",
                    "",
                  );
                } else if (contentDivBtnValue == "subscription") {
                  Constants.contentPrice = "";
                }

                // pass price
                passDivBtn = Constants.paywallConfig.data?.configuration?.mobile
                    ?.json?.slotData?.slot?.passDivBtn?.value;
                if (passDivBtn == "content") {
                  Constants.passPrice = valueOrDefault<String>(
                    "${Constants.contentDetails2?.microPricing?.price.toString()}",
                    "",
                  );
                } else if (passDivBtn == "pass") {
                  Constants.passPrice = valueOrDefault<String>(
                    "${Constants.contentDetails2?.validPass?.price.toString()}",
                    "",
                  );
                } else if (passDivBtn == "subscription") {
                  Constants.passPrice = "";
                }

                // subscription price
                subDivBtn = Constants.paywallConfig.data?.configuration?.mobile
                    ?.json?.slotData?.slot?.subDivBtn?.value;
                if (subDivBtn == "content") {
                  Constants.subscriptionPrice = valueOrDefault<String>(
                    "${Constants.contentDetails2?.microPricing?.price.toString()}",
                    "",
                  );
                } else if (subDivBtn == "pass") {
                  Constants.subscriptionPrice = valueOrDefault<String>(
                    "${Constants.contentDetails2?.validPass?.price.toString()}",
                    "",
                  );
                } else if (subDivBtn == "subscription") {
                  Constants.subscriptionPrice = "";
                }

                //RadioBtnOne price
                radioBtnOne = Constants.paywallConfig.data?.configuration
                    ?.mobile?.json?.slotData?.slot?.radioBtnOne?.value;

                if (radioBtnOne == "content") {
                  Constants.contentPrice = valueOrDefault<String>(
                    Constants.contentDetails2?.microPricing?.price.toString(),
                    "",
                  );
                } else if (radioBtnOne == "pass") {
                  Constants.contentPrice = valueOrDefault<String>(
                    Constants.contentDetails2?.validPass?.price.toString(),
                    "",
                  );
                } else if (radioBtnOne == "subscription") {
                  Constants.contentPrice = "";
                }

                //RadioBtnTwo price
                radioBtnTwo = Constants.paywallConfig.data?.configuration
                    ?.mobile?.json?.slotData?.slot?.radioBtnTwo?.value;

                if (radioBtnTwo == "content") {
                  Constants.passPrice = valueOrDefault<String>(
                    Constants.contentDetails2?.microPricing?.price.toString(),
                    "",
                  );
                } else if (radioBtnTwo == "pass") {
                  Constants.passPrice = valueOrDefault<String>(
                    Constants.contentDetails2?.validPass?.price.toString(),
                    "",
                  );
                } else if (radioBtnTwo == "subscription") {
                  Constants.passPrice = "";
                }

                //RadioBtnThree price
                radioBtnThree = Constants.paywallConfig.data?.configuration
                    ?.mobile?.json?.slotData?.slot?.radioBtnThree?.value;

                if (radioBtnThree == "content") {
                  Constants.subscriptionPrice = valueOrDefault<String>(
                    Constants.contentDetails2?.microPricing?.price.toString(),
                    "",
                  );
                } else if (radioBtnThree == "pass") {
                  Constants.subscriptionPrice = valueOrDefault<String>(
                    Constants.contentDetails2?.validPass?.price.toString(),
                    "",
                  );
                } else if (radioBtnThree == "subscription") {
                  Constants.subscriptionPrice = "";
                }

                Constants.contentPrice = (Constants.contentPrice == "")
                    ? ""
                    : "${Constants.contentDetails2?.currencySymbol}${Constants.contentPrice}";
                Constants.passPrice = (Constants.passPrice == "")
                    ? ""
                    : "${Constants.contentDetails2?.currencySymbol}${Constants.passPrice}";
                Constants.subscriptionPrice = (Constants.subscriptionPrice ==
                        "")
                    ? ""
                    : "${Constants.contentDetails2?.currencySymbol}${Constants.subscriptionPrice}";

                double opacity = 0;
                Alignment alignment = Alignment.bottomCenter;
                if (paywallconfigResponse
                        .data?.configuration?.mobile?.templateId?.displayType ==
                    "FULLPAGE") {
                  opacity = 0.7;
                }
                if (paywallconfigResponse
                        .data?.configuration?.mobile?.templateId?.displayType ==
                    "POPUP") {
                  opacity = 0.7;
                  alignment = Alignment.center;
                }

                return Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black.withOpacity(opacity)
                          //Text
                          ),
                      if (snapshot.hasData)
                        Container(
                          alignment: alignment,
                          child: PaywallUI((response) {
                            widget.sessionCallback(response);
                          },
                              paywallconfigResponse:
                                  paywallconfigResponse), //Text
                        ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}

@immutable
class PaywallUI extends StatefulWidget {
  Function(bool) sessionCallback;

  final PaywallConfig paywallconfigResponse;

  PaywallUI(this.sessionCallback,
      {Key? key, required this.paywallconfigResponse})
      : super(key: key);

  @override
  _PaywallUI createState() => _PaywallUI();
}

class _PaywallUI extends State<PaywallUI> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ('${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.paywallType}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.name}' ==
        "REGULAR5A") {
      return Inarticle5A3CTAWidget((response) {
        widget.sessionCallback(response);
      });
    } else if ('${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.paywallType}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.name}' ==
        "REGULAR3A") {
      return Paywall3A((response) {
        widget.sessionCallback(response);
      });
    } else if ('${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.paywallType}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.name}' ==
        "REGULAR7A") {
      return Inarticle7A1CTAWidget((response) {
        widget.sessionCallback(response);
      });
    } else if ('${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.paywallType}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.name}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.numberOfCta}' ==
        "REGULAR8A2") {
      return Inarticle8A2CTAWidget((response) {
        widget.sessionCallback(response);
      });
    } else if ('${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.paywallType}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.name}${widget.paywallconfigResponse.data?.configuration?.mobile?.templateId?.numberOfCta}' ==
        "REGULAR8A1") {
      return InArticle8A1CTAWidget((response) {
        widget.sessionCallback(response);
      });
    }
    return Paywall3A((response) {
      widget.sessionCallback(response);
    });
  }
}
