part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitState extends PaymentState {
  const PaymentInitState();
}

class PaymentValidateState extends PaymentState {
  const PaymentValidateState({
    this.isValid = false,
  });

  final bool isValid;

  @override
  List<Object?> get props => [
        isValid,
      ];
}
