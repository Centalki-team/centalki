import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../generated/l10n.dart';

class IAPCard extends StatefulWidget {
  const IAPCard({
    Key? key,
    required this.product,
    required this.productsDetail,
    required this.onPress,
  }) : super(key: key);

  final ProductDetails product;
  final Map<String, dynamic> productsDetail;
  final Function() onPress;

  @override
  State<IAPCard> createState() => _IAPCardState();
}

class _IAPCardState extends State<IAPCard> {
  final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: colorsByTheme(context).backgroundCardsChip,
          borderRadius: const BorderRadius.all(Radius.circular(radius12)),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow.shade200,
              spreadRadius: 0,
              blurRadius: 12.0,
              offset: const Offset(1, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: padding16, vertical: padding16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productsDetail[widget.product.id]?['options']
                              as String,
                          style: TextStyle(
                            fontSize: labelMediumSize,
                            fontWeight: labelMediumWeight,
                            color: widget
                                    .productsDetail[widget.product.id]!['color']
                                as Color,
                            height: 1,
                          ),
                        ),
                        Text(
                          widget.productsDetail[widget.product.id]?['name']
                              as String,
                          style: TextStyle(
                            fontSize: titleLargeSize,
                            fontWeight: titleLargeWeight,
                            color: colorsByTheme(context).defaultFont,
                            height: 1,
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (widget.productsDetail[widget.product.id]
                                  ?['desc'] as List<String>)
                              .length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: spacing4),
                          itemBuilder: (context, index) => Row(
                            children: [
                              const Icon(
                                Icons.check_outlined,
                                color: AppColor.support,
                              ),
                              const SizedBox(width: spacing12),
                              Expanded(
                                child: Text(
                                  (widget.productsDetail[widget.product.id]
                                      ?['desc'] as List<String>)[index],
                                  style: TextStyle(
                                    fontSize: bodySmallSize,
                                    fontWeight: bodySmallWeight,
                                    color: colorsByTheme(context).defaultFont,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: spacing8),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          currencyFormat.format(widget.product.rawPrice),
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: colorsByTheme(context).defaultFont,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: spacing8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: padding8, vertical: padding4),
                          decoration: BoxDecoration(
                            color: (widget.productsDetail[widget.product.id]
                                        ?['save'] as String)
                                    .isEmpty
                                ? colorsByTheme(context).backgroundCardsChip
                                : AppColor.support,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(radius16),
                            ),
                          ),
                          child: Text(
                            (widget.productsDetail[widget.product.id]?['save']
                                        as String)
                                    .isEmpty
                                ? ''
                                : widget.productsDetail[widget.product.id]
                                    ?['save'] as String,
                            style: const TextStyle(
                              fontSize: bodySmallSize,
                              fontWeight: bodySmallWeight,
                              color: AppColor.white,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacing16),
              AppFilledButton(
                text: S.current.txtPurchase,
                onPressed: () => widget.onPress(),
                minimumSize: const Size.fromHeight(48),
              ),
            ],
          ),
        ),
      );
}
