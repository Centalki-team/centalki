// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_topics_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetTopicsParamsToJson(GetTopicsParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('levelId', instance.levelId);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('keyword', instance.keyword);
  return val;
}
