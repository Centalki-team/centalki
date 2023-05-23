part of 'payment_bloc.dart';

abstract class PaymentEvent {
  const PaymentEvent();
}

class PaymentInitEvent extends PaymentEvent {
  const PaymentInitEvent();
}

class PaymentGetProductsEvent extends PaymentEvent {
  const PaymentGetProductsEvent();
}

class PaymentPurchaseEvent extends PaymentEvent {
  const PaymentPurchaseEvent({required this.product});

  final ProductDetails product;
}

class PaymentCancelPurchaseEvent extends PaymentEvent {
  const PaymentCancelPurchaseEvent();
}

class PaymentOccurErrorEvent extends PaymentEvent {
  const PaymentOccurErrorEvent(this.exception);

  final AppException exception;
}

class PaymentVerifyPurchaseEvent extends PaymentEvent {
  const PaymentVerifyPurchaseEvent(this.purchaseDetails);

  final PurchaseDetails purchaseDetails;
}

class PaymentCompletePurchaseEvent extends PaymentEvent {
  const PaymentCompletePurchaseEvent(this.purchaseDetails);

  final PurchaseDetails purchaseDetails;
}
