import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitState()) {
    on<WalletInitEvent>(_onInit);
    on<WalletGetMoreEvent>(_onGetMore);
  }

  void _onInit(WalletInitEvent event, emit) async {
    emit(const WalletLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const WalletLoadDoneState());
  }

  void _onGetMore(WalletGetMoreEvent event, emit) {}
}
