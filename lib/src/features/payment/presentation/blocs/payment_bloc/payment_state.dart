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

class PaymentLoadingState extends PaymentState {
  const PaymentLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class PaymentUploadPresignedUrlSuccess extends PaymentState {
  const PaymentUploadPresignedUrlSuccess({
    required this.uploadedUrl,
  });

  final String uploadedUrl;

  @override
  List<Object?> get props => [
        uploadedUrl,
      ];
}

class PaymentErrorState extends PaymentState {
  const PaymentErrorState({
    required this.exception,
    this.displayMessage,
  });

  final AppException exception;
  final String? displayMessage;

  @override
  List<Object?> get props => [
        exception,
        displayMessage,
      ];
}

class PaymentCreateReceiptDoneState extends PaymentState {
  const PaymentCreateReceiptDoneState();
}

class PaymentCreateReceiptErrorState extends PaymentState {
  const PaymentCreateReceiptErrorState({
    required this.exception,
    this.displayMessage,
  });

  final AppException exception;
  final String? displayMessage;

  @override
  List<Object?> get props => [
        exception,
        displayMessage,
      ];
}
