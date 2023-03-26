import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/payment_method_entity.dart';

part 'payment_info.g.dart';

@JsonSerializable(createToJson: false)
class PaymentMethodInfoModel extends PaymentMethodInfoEntity {
  const PaymentMethodInfoModel(
    PaymentMethodMomoModel? momo,
    PaymentMethodBankingModel? banking,
  ) : super(
          momo: momo,
          banking: banking,
        );

  factory PaymentMethodInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodInfoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaymentMethodMomoModel extends PaymentMethodMomoEntity {
  const PaymentMethodMomoModel(
    String? transferCode,
    String? accountHolder,
    String? phoneNumber,
  ) : super(
          transferCode: transferCode ?? '',
          accountHolder: accountHolder ?? '',
          phoneNumber: phoneNumber ?? '',
        );

  factory PaymentMethodMomoModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodMomoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaymentMethodBankingModel extends PaymentMethodBankingEntity {
  const PaymentMethodBankingModel(
    String? accountHolder,
    String? accountNumber,
    String? bank,
  ) : super(
          accountHolder: accountHolder ?? '',
          accountNumber: accountNumber ?? '',
          bank: bank ?? '',
        );

  factory PaymentMethodBankingModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodBankingModelFromJson(json);
}
