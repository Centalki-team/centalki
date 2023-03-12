// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_presigned_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPresignedUrlModel _$PaymentPresignedUrlModelFromJson(
        Map<String, dynamic> json) =>
    PaymentPresignedUrlModel(
      meta: json['meta'] == null
          ? null
          : PaymentPresignedUrlMetaModel.fromJson(
              json['meta'] as Map<String, dynamic>),
      data: json['data'] as String?,
    );

PaymentPresignedUrlMetaModel _$PaymentPresignedUrlMetaModelFromJson(
        Map<String, dynamic> json) =>
    PaymentPresignedUrlMetaModel(
      expires: json['expires'] as int?,
      version: json['version'] as String?,
      filename: json['filename'] as String?,
      contentType: json['contentType'] as String?,
    );
