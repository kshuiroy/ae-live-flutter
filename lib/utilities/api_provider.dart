import 'dart:convert';

import 'package:ae_live/utilities/check_internet_connection.dart';
import 'package:http/http.dart' as http;

class APIProvider {
  APIProvider();

  Future<String> fetchAPI({required final String url}) async {
    // debugPrint(
    //     '[APIProvider::class/fetchAPI] Making request to URL: "$url"...');

    if (await isConnectedToInternet()) {
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
