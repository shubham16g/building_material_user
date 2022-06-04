

import 'dart:convert';

import 'package:building_material_user/models/demo_entity.dart';
import 'package:building_material_user/network/api_response.dart';
import 'package:building_material_user/network/dio_connect.dart';
import 'package:building_material_user/network/service/api_service.dart';
import 'package:flutter/services.dart';

class DevApiService extends ApiService {

  final DioConnect dioConnect;

  DevApiService(this.dioConnect);

  @override
  Future<ApiResponse<DemoEntity>> getDemoList() async {
    Future.delayed(const Duration(seconds: 1));
    String data = await rootBundle.loadString("test/demo.json");
    return ApiResponse(statusCode: 200, data: DemoEntity.fromJson(json.decode(data)));

  }
}