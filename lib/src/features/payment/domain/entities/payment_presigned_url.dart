import 'package:equatable/equatable.dart';

class PaymentPresignedUrlEntity extends Equatable {
  const PaymentPresignedUrlEntity({
    required this.data,
  });

  final String data;

  @override
  List<Object?> get props => [
        data,
      ];
}
