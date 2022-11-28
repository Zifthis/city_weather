import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider<LocalStorage>(
  (_) => StorageImp(SharedPreferences.getInstance()),
);

abstract class LocalStorage {
  Future<bool> setStringList(List<String> list);
  Future<List<String>> getStringList();
}

class StorageImp implements LocalStorage {
  final Future<SharedPreferences> _futureSharedPreferences;
  SharedPreferences? _sharedPreferencesInstance;

  StorageImp(this._futureSharedPreferences);

  Future<SharedPreferences> get _sharedPreferences async {
    _sharedPreferencesInstance ??= await _futureSharedPreferences;
    return _sharedPreferencesInstance!;
  }

  @override
  Future<List<String>> getStringList() async {
    return (await _sharedPreferences).getStringList(listKey) ?? [];
  }

  @override
  Future<bool> setStringList(List<String> value) async {
    return (await _sharedPreferences).setStringList(listKey, value);
  }
}

const String listKey = "listKey";
