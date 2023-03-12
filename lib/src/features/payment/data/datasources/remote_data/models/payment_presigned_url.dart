import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/payment_presigned_url.dart';

part 'payment_presigned_url.g.dart';

@JsonSerializable(createToJson: false)
class PaymentPresignedUrlModel extends PaymentPresignedUrlEntity {
  const PaymentPresignedUrlModel({
    this.meta,
    String? data,
  }) : super(
          data: data ?? '',
        );

  final PaymentPresignedUrlMetaModel? meta;

  static PaymentPresignedUrlModel fromJson(Map<String, dynamic> json) =>
      _$PaymentPresignedUrlModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaymentPresignedUrlMetaModel {
  const PaymentPresignedUrlMetaModel({
    this.expires,
    this.version,
    this.filename,
    this.contentType,
  });

  final int? expires;
  final String? version;
  final String? filename;
  final String? contentType;

  static PaymentPresignedUrlMetaModel fromJson(Map<String, dynamic> json) =>
      _$PaymentPresignedUrlMetaModelFromJson(json);
}
