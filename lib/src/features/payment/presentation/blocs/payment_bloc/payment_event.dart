part of 'payment_bloc.dart';

abstract class PaymentEvent {
  const PaymentEvent();
}

class PaymentValidateEvent extends PaymentEvent {
  const PaymentValidateEvent();
}
