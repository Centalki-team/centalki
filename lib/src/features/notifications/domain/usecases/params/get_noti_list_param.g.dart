// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_noti_list_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetNotiListParamToJson(GetNotiListParam instance) {
  final val = <String, dynamic>{
    'page': instance.page,
    'size': instance.size,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sort', _$SortCreatedAtEnumEnumMap[instance.sort]);
  return val;
}

const _$SortCreatedAtEnumEnumMap = {
  SortCreatedAtEnum.asc: 'createdAt:asc',
  SortCreatedAtEnum.desc: 'createdAt:desc',
};
