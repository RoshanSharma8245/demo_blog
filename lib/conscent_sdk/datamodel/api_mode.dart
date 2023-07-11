class APIMode {
  static const String _URL_STAGE = "https://stage.tsbdev.co/";
  static const String _URL_PROD = "https://api.conscent.in/";
  static const String _URL_SANDBOX = "https://sandbox-api.conscent.in/";
  static String BASE_URL = "";

  static const _SERVICE_URL_STAGE = "https://dashboards.tsbdev.co";
  static const _SERVICE_URL_SANDBOX = "https://sandbox-user.conscent.in";
  static const _SERVICE_URL_PROD = "https://user.conscent.in";
  static String SERVICE_BASE_URL = "";

  static const _EVENT_URL_STAGE = "https://collections.tsbdev.co";
  static const _EVENT_URL_PROD = "https://collections.conscent.in";
  static String EVENT_BASE_URL = "";

  static String getConscentServiceUrl(ENVIRONMENTMODE key) {
    if (key == ENVIRONMENTMODE.STAGE) {
      BASE_URL = _URL_STAGE;
      SERVICE_BASE_URL = _SERVICE_URL_STAGE;
      EVENT_BASE_URL = _EVENT_URL_STAGE;
      return _URL_STAGE;
    }
    if (key == ENVIRONMENTMODE.SANDBOX) {
      SERVICE_BASE_URL = _SERVICE_URL_SANDBOX;
      BASE_URL = _URL_SANDBOX;
      EVENT_BASE_URL = _EVENT_URL_STAGE;
      return _URL_SANDBOX;
    }

    if (key == ENVIRONMENTMODE.PRODUCTION) {
      SERVICE_BASE_URL = _SERVICE_URL_PROD;
      BASE_URL = _URL_PROD;
      EVENT_BASE_URL = _EVENT_URL_PROD;
      return _URL_PROD;
    }
    return _URL_STAGE;
  }
}

enum ENVIRONMENTMODE { STAGE, PRODUCTION, SANDBOX }
