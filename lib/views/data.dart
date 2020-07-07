import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Data {
  static getData() async {
    var prefs = await SharedPreferences.getInstance();

    var savedData = prefs.getString('');

    if (savedData == null) {
      savedData = '[]';
    }

    return json.decode(savedData);
  }

  static saveData(data) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString('', json.encode(data));
  }
}
