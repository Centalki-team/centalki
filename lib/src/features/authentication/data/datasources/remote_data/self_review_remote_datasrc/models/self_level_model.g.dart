// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfLevelModel _$SelfLevelModelFromJson(Map<String, dynamic> json) =>
    SelfLevelModel(
      json['id'] as String?,
      json['code'] as String?,
      json['name'] as String?,
      $enumDecodeNullable(_$LevelTypeEnumEnumMap, json['typeForEntity']),
    );

const _$LevelTypeEnumEnumMap = {
  LevelTypeEnum.specific: 'SPECIFIC',
  LevelTypeEnum.unknown: 'UNKNOWN',
  LevelTypeEnum.notShare: 'NOT_SHARE',
};
