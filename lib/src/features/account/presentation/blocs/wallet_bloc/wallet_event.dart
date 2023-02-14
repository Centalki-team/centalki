part of 'wallet_bloc.dart';

abstract class WalletEvent {
  const WalletEvent();
}

class WalletInitEvent extends WalletEvent {
  const WalletInitEvent();
}

class WalletGetMoreEvent extends WalletEvent {
  const WalletGetMoreEvent();
}
