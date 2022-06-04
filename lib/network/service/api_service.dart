
import 'package:building_material_user/models/demo_entity.dart';
import 'package:building_material_user/network/api_response.dart';

abstract class ApiService {

  Future<ApiResponse<DemoEntity>> getDemoList();

}
