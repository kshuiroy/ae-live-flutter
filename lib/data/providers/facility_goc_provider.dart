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
}
