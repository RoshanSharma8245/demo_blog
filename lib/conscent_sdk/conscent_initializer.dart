import 'conscent_methods.dart';
import 'datamodel/api_mode.dart';

class ConscentInitializer {
  String? clientId;
  static String? mClientId;
  ENVIRONMENTMODE? apiMode;
  static String? mContentId;

  ConscentInitializer(String this.clientId, ENVIRONMENTMODE this.apiMode) {
    if (clientId == null) {
      ConscentMethods()
          .onPluginError("Client ID is invalid, please check again");
    }

    mClientId = clientId;

    APIMode.getConscentServiceUrl(apiMode!);
  }

  static setContentId(String contentId) {
    if (contentId.isEmpty) {
      ConscentMethods()
          .onPluginError("Content ID is invalid, please check again");
    }
    mContentId = contentId;
  }

  static String? getContentId(String contentId) {
    return mContentId;
  }

  static setClientId(String clientId) {
    mClientId = clientId;
  }
}
