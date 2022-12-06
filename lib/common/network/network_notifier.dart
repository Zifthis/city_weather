import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider =
    StateNotifierProvider<NetworkNotifier, ConnectivityResult?>(
  (ref) => NetworkNotifier(),
);

class NetworkNotifier extends StateNotifier<ConnectivityResult?> {
  NetworkNotifier() : super(null) {
    init();
  }

  void init() => Connectivity().onConnectivityChanged.listen(
        (e) {
          state = e;
        },
      );
}
