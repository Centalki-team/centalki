part of 'payment_bloc.dart';

abstract class PaymentEvent {
  const PaymentEvent();
}

class PaymentValidateEvent extends PaymentEvent {
  const PaymentValidateEvent();
}

class PaymentUploadImageEvent extends PaymentEvent {
  const PaymentUploadImageEvent({
    required this.img,
  });

  final XFile img;
}

class PaymentUploadPresignedUrlEvent extends PaymentEvent {
  const PaymentUploadPresignedUrlEvent({
    required this.img,
    required this.url,
  });

  final XFile img;
  final String url;
}

class PaymentCreateReceiptEvent extends PaymentEvent {
  const PaymentCreateReceiptEvent({
    required this.imgUrl,
  });

  final String imgUrl;
}
