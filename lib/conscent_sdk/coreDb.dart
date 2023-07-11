import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'conscent_methods.dart';

class CoreDb {
  static const _SESSION_ID = 'sessionId';
  static const _ANON_ID = 'anonId';
  static const _PING_ID = 'pingId';
  static const _CLIENT_ID = 'clientId';
  static const _API_MODE = 'apiMode';
  static const _CONTENT_ID = 'content_id';
  static const _SUBS_URL = 'SUBSURL';
  static const _USER_TYPE = "userType";
  static const _LOGIN_ID = 'loginId';
  static const _USER_ID = 'userId';

  //Creating singleton of CoreDb
  CoreDb._();

  static CoreDb? _obj;

  static instance() {
    _obj ??= CoreDb._();
    return _obj;
  }

//Getting document path using path provider package
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//getting instance of file using localPath
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/preference.json');
  }

//function to write data in file
  void _writeData(Map<String, dynamic> data) async {
    File file = await _localFile;
    Map<String, dynamic> tempMap;

    if (await file.exists()) {
      tempMap = json.decode(file.readAsStringSync());

      tempMap.addAll(data);

      file.writeAsStringSync(json.encode(tempMap));
    } else {
      file.writeAsStringSync(json.encode(data));
    }
  }

//Function to get all the data in json format
  Future<String?> _getData(String key) async {
    File tempFile = await _localFile;
    if (await tempFile.exists()) {
      Map data = json.decode(tempFile.readAsStringSync());
      var result = data[key];
      return result;
    } else {
      return null;
    }
  }

//To delete data if exist in the file
//   Future _deleteData(
//       String dataToDelete, Function onDelte, Function ifNotExist) async {
//     File tempFile = await _localFile;
//     if (!tempFile.existsSync()) {
//       ifNotExist();
//     } else {
//       Map data = json.decode(tempFile.readAsStringSync());
//       var result = data.remove(dataToDelete);
//       if (result == null) {
//         ifNotExist();
//       } else {
//         tempFile.writeAsStringSync(json.encode(data));
//         onDelte();
//       }
//     }
//   }

  Future _deleteData(String dataToDelete) async {
    File tempFile = await _localFile;
    if (!tempFile.existsSync()) {
      ConscentMethods().onPluginError("NotExist $dataToDelete");
    } else {
      Map data = json.decode(tempFile.readAsStringSync());
      var result = data.remove(dataToDelete);
      if (result == null) {
        ConscentMethods().onPluginError("NotExist $dataToDelete");
      } else {
        tempFile.writeAsStringSync(json.encode(data));
        // ConscentMethods().onPluginError("Deleted $dataToDelete");
      }
    }
  }

  void deleteSessionId() async {
    CoreDb.instance()._deleteData(_SESSION_ID);
  }

  void deleteAnonId() async {
    CoreDb.instance()._deleteData(_ANON_ID);
  }

  void deleteSubsUrl() async {
    CoreDb.instance()._deleteData(_SUBS_URL);
  }

  void deleteUserType() async {
    CoreDb.instance()._deleteData(_USER_TYPE);
  }

  void deleteLoginId() async {
    CoreDb.instance()._deleteData(_LOGIN_ID);
  }

  void deleteUserId() async {
    CoreDb.instance()._deleteData(_USER_ID);
  }

  void setSessionId(String? sessionId) async {
    if (sessionId != null) {
      await CoreDb.instance()._writeData({_SESSION_ID: sessionId});
    } else {
      await CoreDb.instance()._writeData({_SESSION_ID: ""});
    }
  }

  Future<String?>? getSessionId() async {
    return await CoreDb.instance()._getData(_SESSION_ID);
  }

  void setAnonId(String? anonId) async {
    if (anonId != null) {
      await CoreDb.instance()._writeData({_ANON_ID: anonId});
    } else {
      await CoreDb.instance()._writeData({_ANON_ID: ""});
    }
  }

  Future<String?>? getAnonId() async {
    return await CoreDb.instance()._getData(_ANON_ID);
  }

  void setPingId(String? pingId) async {
    if (pingId != null) {
      await CoreDb.instance()._writeData({_PING_ID: pingId});
    } else {
      await CoreDb.instance()._writeData({_PING_ID: ""});
    }
  }

  Future<String?>? getPingId() async {
    return await CoreDb.instance()._getData(_PING_ID);
  }

  void setSubsUrl(String? subsUrl) async {
    if (subsUrl != null) {
      await CoreDb.instance()._writeData({_SUBS_URL: subsUrl});
    } else {
      await CoreDb.instance()._writeData({_SUBS_URL: ""});
    }
  }

  Future<String?>? getSubsUrl() async {
    return await CoreDb.instance()._getData(_SUBS_URL);
  }

  void setUserType(String? userType) async {
    if (userType != null) {
      await CoreDb.instance()._writeData({_USER_TYPE: userType});
    } else {
      await CoreDb.instance()._writeData({_USER_TYPE: ""});
    }
  }

  Future<String?>? getUserType() async {
    return await CoreDb.instance()._getData(_USER_TYPE);
  }

  void setLoginId(String? loginId) async {
    if (loginId != null) {
      await CoreDb.instance()._writeData({_LOGIN_ID: loginId});
    } else {
      await CoreDb.instance()._writeData({_LOGIN_ID: ""});
    }
  }

  Future<String?>? getLoginId() async {
    return await CoreDb.instance()._getData(_LOGIN_ID);
  }

  void setUserId(String? userId) async {
    if (userId != null) {
      await CoreDb.instance()._writeData({_USER_ID: userId});
    } else {
      await CoreDb.instance()._writeData({_USER_ID: ""});
    }
  }

  Future<String?>? getUserId() async {
    return await CoreDb.instance()._getData(_USER_ID);
  }
}
