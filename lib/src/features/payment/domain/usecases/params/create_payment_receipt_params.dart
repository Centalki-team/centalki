import 'package:json_annotation/json_annotation.dart';

part 'create_payment_receipt_params.g.dart';

@JsonSerializable(createFactory: false)
class CreatePaymentReceiptParams {
  const CreatePaymentReceiptParams({
    required this.imageURLs,
  });

  final List<String> imageURLs;

  Map<String, dynamic> toJson() => _$CreatePaymentReceiptParamsToJson(this);
}
