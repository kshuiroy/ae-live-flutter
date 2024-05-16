import 'package:ae_live/config/constants.dart';
import 'package:ae_live/utilities/api_provider.dart';

class FacilityHospitalProvider {
  final APIProvider _apiProvider = APIProvider();

  Future<String> getFacilityHospitalData() async {
    try {
      final String response = await _apiProvider.fetchAPI(
        url: Constants.apiFacilityHospital,
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }
}
