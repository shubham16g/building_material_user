import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'demo_entity.g.dart';

@JsonSerializable()
class DemoEntity {

	final int page;
	@JsonKey(name: "per_page")
	final int perPage;
	final int total;
	@JsonKey(name: "total_pages")
	final int totalPages;
	final List<DemoData> data;
	final DemoSupport support;
  
  DemoEntity(this.page, this.perPage, this.total, this.totalPages, this.data,this.support);

  factory DemoEntity.fromJson(Map<String, dynamic> json) => _$DemoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DemoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DemoData {

	final int id;
	final String? name;
	final int year;
	final String color;
	@JsonKey(name: "pantone_value")
	final String pantoneValue;
  
  DemoData(this.id, this.name, this.year, this.color, this.pantoneValue);

  factory DemoData.fromJson(Map<String, dynamic> json) => _$DemoDataFromJson(json);

  Map<String, dynamic> toJson() => _$DemoDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DemoSupport {

	final String url;
	final String text;
  
  DemoSupport(this.url, this.text);

  factory DemoSupport.fromJson(Map<String, dynamic> json) => _$DemoSupportFromJson(json);

  Map<String, dynamic> toJson() => _$DemoSupportToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}