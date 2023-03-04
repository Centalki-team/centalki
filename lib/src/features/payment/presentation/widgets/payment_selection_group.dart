import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../domain/entities/payment_method_entity.dart';
import 'payment_method_item.dart';

class PaymentSelectionGroup extends StatefulWidget {
  const PaymentSelectionGroup({
    super.key,
    this.initValue,
    this.methodsList = const [],
    this.onChanged,
  });

  final PaymentMethodEntity? initValue;
  final List<PaymentMethodEntity> methodsList;
  final ValueChanged<PaymentMethodEntity>? onChanged;

  @override
  State<PaymentSelectionGroup> createState() => _PaymentSelectionGroupState();
}

class _PaymentSelectionGroupState extends State<PaymentSelectionGroup> {
  PaymentMethodEntity? curValue;

  @override
  void initState() {
    super.initState();
    curValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: widget.methodsList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            widget.onChanged?.call(widget.methodsList[index]);
            setState(() {
              curValue = widget.methodsList[index];
            });
          },
          child: PaymentMethodItem(
            isSelected: curValue == widget.methodsList[index],
            paymentMethodEntity: widget.methodsList[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: spacing16,
        ),
      );
}
