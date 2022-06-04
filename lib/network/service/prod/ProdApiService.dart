

import 'package:building_material_user/models/demo_entity.dart';
import 'package:building_material_user/network/api_response.dart';
import 'package:building_material_user/network/dio_connect.dart';
import 'package:building_material_user/network/service/api_service.dart';

class ProdApiService extends ApiService {

  final DioConnect dioConnect;

  ProdApiService(this.dioConnect);

  static const String baseUrl = 'https://reqres.in/api';

  @override
  Future<ApiResponse<DemoEntity>> getDemoList() {
    return dioConnect.call(caller: (dio)=>dio.get("$baseUrl/unknown"), converter: (data)=>DemoEntity.fromJson(data));
  }


}