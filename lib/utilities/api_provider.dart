import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class APIProvider {
  APIProvider();

  Future<String> fetchAPI({required final String url}) async {
    // debugPrint(
    //     '[APIProvider::class/fetchAPI] Making request to URL: "$url"...');

    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    final List<ConnectivityResult> validConnectivityMethods = [
      ConnectivityResult.ethernet,
      ConnectivityResult.mobile,
      ConnectivityResult.other,
      ConnectivityResult.vpn,
      ConnectivityResult.wifi,
    ];

    if (connectivityResult
        .any((element) => validConnectivityMethods.contains(element))) {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'content-type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes);
      } else {
        throw Exception(
          'Failed to fetch "$url" with status code: ${response.statusCode}',
        );
      }
    } else {
      throw Exception('Failed to fetch "$url": No Internet Connection.');
    }
  }
}
