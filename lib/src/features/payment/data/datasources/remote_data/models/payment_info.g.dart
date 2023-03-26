// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodInfoModel _$PaymentMethodInfoModelFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodInfoModel(
      json['momo'] == null
          ? null
          : PaymentMethodMomoModel.fromJson(
              json['momo'] as Map<String, dynamic>),
      json['banking'] == null
          ? null
          : PaymentMethodBankingModel.fromJson(
              json['banking'] as Map<String, dynamic>),
    );

PaymentMethodMomoModel _$PaymentMethodMomoModelFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodMomoModel(
      json['transferCode'] as String?,
      json['accountHolder'] as String?,
      json['phoneNumber'] as String?,
    );

PaymentMethodBankingModel _$PaymentMethodBankingModelFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodBankingModel(
      json['accountHolder'] as String?,
      json['accountNumber'] as String?,
      json['bank'] as String?,
    );
