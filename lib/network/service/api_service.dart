
import 'package:building_material_user/network/api_response.dart';

abstract class ApiService {

  Future<ApiResponse<String>> getDemoList();

}
