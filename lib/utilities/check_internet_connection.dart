import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnectedToInternet() async {
  final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
  final List<ConnectivityResult> validConnectivityMethods = [
    ConnectivityResult.ethernet,
    ConnectivityResult.mobile,
    ConnectivityResult.other,
    ConnectivityResult.vpn,
    ConnectivityResult.wifi,
  ];

  return connectivityResult
      .any((element) => validConnectivityMethods.contains(element));
}
