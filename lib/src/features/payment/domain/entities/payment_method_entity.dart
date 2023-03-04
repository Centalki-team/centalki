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
    required this.methodId,
    required this.methodType,
  });

  final String methodName;
  final String methodId;
  final PaymentMethodEnum methodType;

  @override
  List<Object?> get props => [
        methodName,
        methodId,
        methodType,
      ];
}
