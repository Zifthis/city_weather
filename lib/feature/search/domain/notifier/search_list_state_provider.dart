import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchListStateProvider = Provider<List<String>>(
  (ref) {
    List<String> userLocationList = [];
    return userLocationList;
  },
);
