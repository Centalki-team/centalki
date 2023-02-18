import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitState()) {
    on<WalletInitEvent>(_onInit);
    on<WalletGetMoreEvent>(_onGetMore);
  }

  void _onInit(WalletInitEvent event, emit) async {
    emit(const WalletLoadingState());
    try {
      final balanceInformation = await FirebaseAuth.instance.currentUser
          ?.getIdToken()
          .then(DioClient.getAccountBalance);
      emit(WalletLoadDoneState(
          balanceInformation?.accountBalance ?? 0,
          (balanceInformation?.accountBalance ?? 0) ~/
              (balanceInformation?.currentCostPerSession ?? 1),
          balanceInformation?.currentCostPerSession ?? 0));
    } on Exception catch (_) {
      emit(WalletLoadFailureState(TextDoc.txtLoadFailed));
    }
  }

  void _onGetMore(WalletGetMoreEvent event, emit) {}
}
