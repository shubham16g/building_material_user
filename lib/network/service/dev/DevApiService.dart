

import 'package:building_material_user/network/api_response.dart';
import 'package:building_material_user/network/service/api_service.dart';

class DevApiService extends ApiService {
  static const String baseUrl = 'https://api.github.com';

  @override
  Future<ApiResponse<String>> getDemoList() {
    throw UnimplementedError();
  }
}