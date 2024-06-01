import 'package:ae_live/config/constants.dart';
import 'package:ae_live/utilities/api_provider.dart';

class FacilityCmcProvider {
  final APIProvider _apiProvider = APIProvider();

  Future<String> getFacilityCmcData() async {
    try {
      final String response = await _apiProvider.fetchAPI(
        url: Constants.apiFacilityCmc,
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }
}
