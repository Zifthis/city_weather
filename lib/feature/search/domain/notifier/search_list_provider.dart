import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchListProvider = Provider<List<String>>(
  (ref) {
    List<String> userLocationList = [];
    return userLocationList;
  },
);
