import '../../../../../../../base/domain/resource.base.dart';

class PaymentGetPresignedUrlResource extends Resource {
  const PaymentGetPresignedUrlResource() : super('/storage/presigned-url');
}

class PaymentCreateReceiptResource extends Resource {
  const PaymentCreateReceiptResource() : super('/transaction/payment-receipt');
}

class PaymentInfoResource extends Resource {
  const PaymentInfoResource() : super('/transaction/payment-info');
}

class PaymentVerifyApplePurchaseResource extends Resource {
  const PaymentVerifyApplePurchaseResource() : super('/transaction/apple/verify-purchase');
}

class PaymentVerifyGooglePurchaseResource extends Resource {
  const PaymentVerifyGooglePurchaseResource() : super('/transaction/google/verify-purchase');
}