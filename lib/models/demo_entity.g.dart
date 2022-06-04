// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoEntity _$DemoEntityFromJson(Map<String, dynamic> json) => DemoEntity(
      json['page'] as int,
      json['per_page'] as int,
      json['total'] as int,
      json['total_pages'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => DemoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      DemoSupport.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DemoEntityToJson(DemoEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
    };

DemoData _$DemoDataFromJson(Map<String, dynamic> json) => DemoData(
      json['id'] as int,
      json['name'] as String?,
      json['year'] as int,
      json['color'] as String,
      json['pantone_value'] as String,
    );

Map<String, dynamic> _$DemoDataToJson(DemoData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantone_value': instance.pantoneValue,
    };

DemoSupport _$DemoSupportFromJson(Map<String, dynamic> json) => DemoSupport(
      json['url'] as String,
      json['text'] as String,
    );

Map<String, dynamic> _$DemoSupportToJson(DemoSupport instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
