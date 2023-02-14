part of 'wallet_bloc.dart';

abstract class WalletState {
  const WalletState();
}

class WalletInitState extends WalletState {}

class WalletLoadingState extends WalletState {
  const WalletLoadingState();
}

class WalletLoadDoneState extends WalletState {
  const WalletLoadDoneState();
}

class WalletLoadFailureState extends WalletState {
  const WalletLoadFailureState(this.message);

  final String message;
}