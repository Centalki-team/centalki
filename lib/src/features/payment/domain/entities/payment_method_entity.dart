import 'package:equatable/equatable.dart';

import '../../../../../gen/assets.gen.dart';

enum PaymentMethodEnum {
  momo,
  credit,
  paypal,
}

extension PaymentMethodEnumX on PaymentMethodEnum {
  SvgGenImage get methodLogo {
    switch (this) {
      case PaymentMethodEnum.momo:
        return Assets.logo.logoMomo;
      case PaymentMethodEnum.credit:
        return Assets.logo.logoCreditCard;
      case PaymentMethodEnum.paypal:
        return Assets.logo.logoPaypal;
    }
  }
}

class PaymentMethodEntity extends Equatable {
  const PaymentMethodEntity({
    required this.methodName,
    this.methodCode,
    required this.methodType,
    required this.accountHolder,
    this.accountNumber,
    required this.phoneNumber,
    this.bankName,
  });

  final String methodName;
  final String? methodCode;
  final PaymentMethodEnum methodType;
  final String accountHolder;
  final String? accountNumber;
  final String phoneNumber;
  final String? bankName;

  @override
  List<Object?> get props => [
        methodName,
        methodCode,
        methodType,
        accountHolder,
        accountNumber,
        phoneNumber,
        bankName,
      ];
}

class PaymentMethodInfoEntity extends Equatable {
  const PaymentMethodInfoEntity({
    this.momo,
    this.banking,
  });

  final PaymentMethodMomoEntity? momo;
  final PaymentMethodBankingEntity? banking;

  @override
  List<Object?> get props => [
        momo,
        banking,
      ];
}

class PaymentMethodMomoEntity extends Equatable {
  const PaymentMethodMomoEntity({
    required this.transferCode,
    required this.accountHolder,
    required this.phoneNumber,
  });

  final String transferCode;
  final String accountHolder;
  final String phoneNumber;

  @override
  List<Object?> get props => [
        transferCode,
        accountHolder,
        phoneNumber,
      ];
}

class PaymentMethodBankingEntity extends Equatable {
  const PaymentMethodBankingEntity({
    required this.accountHolder,
    required this.accountNumber,
    required this.bank,
  });

  final String accountHolder;
  final String accountNumber;
  final String bank;

  @override
  List<Object?> get props => [
        accountHolder,
        accountNumber,
        bank,
      ];
}
