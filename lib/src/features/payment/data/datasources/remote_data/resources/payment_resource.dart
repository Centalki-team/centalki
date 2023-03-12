import '../../../../../../../base/domain/resource.base.dart';

class PaymentGetPresignedUrlResource extends Resource {
  const PaymentGetPresignedUrlResource() : super('/storage/presigned-url');
}

class PaymentCreateReceiptResource extends Resource {
  const PaymentCreateReceiptResource() : super('/transaction/payment-receipt');
}
