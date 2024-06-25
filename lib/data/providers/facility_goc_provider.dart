import 'package:ae_live/config/constants.dart';
import 'package:ae_live/utilities/api_provider.dart';

class FacilityGocProvider {
  final APIProvider _apiProvider = APIProvider();

  Future<String> getFacilityGocData() async {
    try {
      final String response = await _apiProvider.fetchAPI(
        url: Constants.apiFacilityGoc,
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<String>> getGocInfoData() async {
    try {
      final List<String> responses = await Future.wait([
        _apiProvider.fetchAPI(url: Constants.apiGocQuotaTC),
        _apiProvider.fetchAPI(url: Constants.apiGocQuotaSC),
        _apiProvider.fetchAPI(url: Constants.apiGocQuotaEN),
      ]);

      return responses;
    } catch (error) {
      throw error.toString();
    }
  }
}
