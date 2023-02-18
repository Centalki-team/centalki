import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/balance_entity.dart';

part 'balance_model.g.dart';

@JsonSerializable(createToJson: false)
class BalanceModel extends BalanceEntity {
  const BalanceModel({
    this.balance,
    this.costPerSession,
    this.currency,
    this.displayBalance,
    this.displayCostPerSession,
  }) : super(
          accountBalance: balance,
          currentCostPerSession: costPerSession,
        );

  final int? balance;
  final int? costPerSession;
  final String? currency;
  final String? displayBalance;
  final String? displayCostPerSession;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}
