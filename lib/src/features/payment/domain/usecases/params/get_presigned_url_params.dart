import 'package:json_annotation/json_annotation.dart';

part 'get_presigned_url_params.g.dart';

@JsonSerializable(createFactory: false)
class PaymentGetPresignedUrlParams {
  const PaymentGetPresignedUrlParams({
    required this.filename,
    this.contentType = 'application/octet-stream',
  });

  final String filename;
  final String contentType;

  Map<String, dynamic> toJson() => _$PaymentGetPresignedUrlParamsToJson(this);
}
