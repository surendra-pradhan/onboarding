import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:onboarding/helpers/httpexception_message.dart';

class DataProvider with ChangeNotifier {
  final String token;
  DataProvider({required this.token, required this.genratedToken});

  List _storeData = [];

  String genratedToken = '';
  List _storeOwner = [];
  List _storeIncharge = [];
  List get storedata {
    return [..._storeData];
  }

  List get storeOwner {
    return [..._storeOwner];
  }

  List get storeIncharge {
    return [..._storeIncharge];
  }

  Future getStoreData() async {
    var headers = {'x-access-token': genratedToken};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://staypharma-fxvp3h2vba-el.a.run.app/api/getAllStore'));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      final responsData = await response.stream.bytesToString();

      final res = json.decode(responsData);

      _storeData = [...res['data']];

      genratedToken = res['token'];
      notifyListeners();

      if (res['error'] != null) {
        throw HttpExcption(res['error']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future addOwner(Map<String, dynamic> ownerData, image) async {
    print(image);
    var headers = {'x-access-token': genratedToken};
    var request = http.MultipartRequest('POST',
        Uri.parse('https://staypharma-fxvp3h2vba-el.a.run.app/api/userSignup'));
    request.fields.addAll({'request': json.encode(ownerData)});
    request.files.add(await http.MultipartFile.fromBytes(
        'file', File(image).readAsBytesSync(),
        filename: image.split("/").last));
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      final responsData = await response.stream.bytesToString();

      final res = json.decode(responsData);

      genratedToken = res['token'];

      notifyListeners();
      print('check$genratedToken');
      if (res['error'] != null) {
        throw HttpExcption(res['error']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getowner(String type) async {
    var headers = {
      'x-access-token': genratedToken,
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staypharma-fxvp3h2vba-el.a.run.app/api/getUserByType'));
    request.body = json.encode({
      "type": [type]
    });
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      final responsData = await response.stream.bytesToString();

      final res = json.decode(responsData);

      _storeOwner = [...res['data']];
      genratedToken = res['token'];

      notifyListeners();

      if (res['error'] != null) {
        throw HttpExcption(res['error']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getStoreIncharge(String type) async {
    var headers = {
      'x-access-token': genratedToken,
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staypharma-fxvp3h2vba-el.a.run.app/api/getUserByType'));
    request.body = json.encode({
      "type": [type]
    });
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      final responsData = await response.stream.bytesToString();

      final res = json.decode(responsData);

      print(res);
      _storeIncharge = res['data'];
      genratedToken = res['token'];

      notifyListeners();

      if (res['error'] != null) {
        throw HttpExcption(res['error']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
