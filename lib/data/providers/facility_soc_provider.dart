import 'package:ae_live/config/constants.dart';
import 'package:ae_live/utilities/api_provider.dart';

class FacilitySocProvider {
  final APIProvider _apiProvider = APIProvider();

  Future<String> getFacilitySocData() async {
    try {
      final String response = await _apiProvider.fetchAPI(
        url: Constants.apiFacilitySoc,
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }
}
