import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchListProvider = StateProvider<List<String>>(
  (ref) {
    List<String> userLocationList = [];
    return userLocationList;
  },
);
