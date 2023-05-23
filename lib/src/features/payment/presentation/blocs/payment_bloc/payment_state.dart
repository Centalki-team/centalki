part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
}

class PaymentInitState extends PaymentState {
  const PaymentInitState();

  @override
  List<Object?> get props => [];
}

class PaymentLoadingState extends PaymentState {
  const PaymentLoadingState();

  @override
  List<Object?> get props => [];
}

class PaymentLoadDoneState extends PaymentState {
  const PaymentLoadDoneState({
    required this.products,
    required this.productsDetail,
  });

  final List<ProductDetails> products;
  final Map<String, dynamic> productsDetail;

  @override
  List<Object?> get props => [products, productsDetail];
}

class PaymentLoadErrorState extends PaymentState {
  const PaymentLoadErrorState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}

class PaymentPurchasingState extends PaymentState {
  const PaymentPurchasingState();

  @override
  List<Object?> get props => [];
}

class PaymentPurchasedDoneState extends PaymentState {
  const PaymentPurchasedDoneState();

  @override
  List<Object?> get props => [];
}

class PaymentPurchasedErrorState extends PaymentState {
  const PaymentPurchasedErrorState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}

class PaymentPurchasedCancelledState extends PaymentState {
  const PaymentPurchasedCancelledState();

  @override
  List<Object?> get props => [];
}