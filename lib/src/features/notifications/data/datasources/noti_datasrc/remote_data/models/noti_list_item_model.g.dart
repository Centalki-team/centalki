// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotiListItemModel _$NotiListItemModelFromJson(Map<String, dynamic> json) =>
    NotiListItemModel(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      createdAt:
          AppDateTimeHelper.stringToTime3Nullable(json['createdAt'] as String?),
      seenAt:
          AppDateTimeHelper.stringToTime3Nullable(json['seenAt'] as String?),
      data: json['data'] == null
          ? null
          : NotiListItemDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : NotiListItemTitleModel.fromJson(
              json['title'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : NotiListItemBodyModel.fromJson(
              json['body'] as Map<String, dynamic>),
    );

NotiListItemDataModel _$NotiListItemDataModelFromJson(
        Map<String, dynamic> json) =>
    NotiListItemDataModel(
      sessionId: json['sessionId'] as String?,
      type: json['type'] as String?,
    );

NotiListItemTitleModel _$NotiListItemTitleModelFromJson(
        Map<String, dynamic> json) =>
    NotiListItemTitleModel(
      en: json['en'] as String?,
    );

NotiListItemBodyModel _$NotiListItemBodyModelFromJson(
        Map<String, dynamic> json) =>
    NotiListItemBodyModel(
      en: json['en'] as String?,
    );
