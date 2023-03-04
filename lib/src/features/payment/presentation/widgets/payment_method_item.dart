import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/styles.dart';
import '../../domain/entities/payment_method_entity.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isSelected = false,
    required this.paymentMethodEntity,
  });

  final bool isSelected;
  final PaymentMethodEntity paymentMethodEntity;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(
          16.0,
          16.0,
          16.0,
          8.0,
        ),
        height: 104.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? AppColor.mainColor2 : AppColor.background,
        ),
        child: Column(
          children: [
            paymentMethodEntity.methodType.methodLogo.svg(
              height: 48.0,
              width: 48.0,
            ),
            const SizedBox(
              height: spacing8,
            ),
            Text(
              paymentMethodEntity.methodName,
              style: const TextStyle(
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: Colors.black,
                height: 1.0,
              ),
            ),
          ],
        ),
      );
}
