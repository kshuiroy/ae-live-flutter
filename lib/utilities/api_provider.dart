import 'dart:convert';

import 'package:http/http.dart' as http;

class APIProvider {
  APIProvider();

  Future<String> fetchAPI({required String url}) async {
    // debugPrint(
    //     '[APIProvider::class/fetchAPI] Making request to URL: "$url"...');

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception(
        'Failed to fetch "$url" with status code: ${response.statusCode}',
      );
    }
  }
}
