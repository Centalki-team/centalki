part of 'wallet_bloc.dart';

abstract class WalletState {
  const WalletState();
}

class WalletInitState extends WalletState {}

class WalletLoadingState extends WalletState {
  const WalletLoadingState();
}

class WalletLoadDoneState extends WalletState {
  const WalletLoadDoneState(
      this.balanceMoney, this.balanceSessions, this.costPerSession);

  final int balanceMoney;
  final int balanceSessions;
  final int costPerSession;
}

class WalletLoadFailureState extends WalletState {
  const WalletLoadFailureState(this.message);

  final String message;
}
