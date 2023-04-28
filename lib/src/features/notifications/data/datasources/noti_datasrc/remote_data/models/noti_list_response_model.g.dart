// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotiListResponseModel _$NotiListResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotiListResponseModel(
      meta: json['meta'] == null
          ? null
          : NotiListMetaDataModel.fromJson(
              json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => NotiListItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
