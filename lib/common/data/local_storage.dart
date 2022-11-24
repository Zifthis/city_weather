import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider<LocalStorage>(
  (_) => LocalStorage(),
);

class LocalStorage {
  void storeStringList(List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(listKey, list);
  }

  Future<List<String>?> getStringList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(listKey);
  }
}

const String listKey = "listKey";
