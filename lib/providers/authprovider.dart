import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/helpers/httpexception_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authprovider with ChangeNotifier {
  String? _token;

  bool get isAuth {
    return token != null;
  }

  get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future login(String username, String passsword) async {
    print(username);
    var request = http.MultipartRequest('POST',
        Uri.parse('https://staypharma-fxvp3h2vba-el.a.run.app/api/login'));
    request.fields.addAll({'username': username, 'password': passsword});
    try {
      http.StreamedResponse response = await request.send();

      final responsData = await response.stream.bytesToString();

      final res = json.decode(responsData);

      _token = res['token'];
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();

      final userData = json.encode({
        'token': _token,
      });

      prefs.setString('userData', userData);
      if (res['error'] != null) {
        throw HttpExcption(res['error']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> tryAutoLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final extractedData = json.decode(prefs.getString('userData').toString())
          as Map<String, dynamic>;

      _token = extractedData['token'].toString();

      notifyListeners();
    } catch (er) {
      print(er);
    }
  }

  Future<void> logout() async {
    _token = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
