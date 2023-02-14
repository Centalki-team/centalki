import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_information_event.dart';
part 'account_information_state.dart';

class AccountInformationBloc extends Bloc<AccountInformationEvent, AccountInformationState> {
  AccountInformationBloc() : super(const AccountInformationInitState()) {
    on<AccountInformationInitEvent>(_onInit);
    on<AccountInformationChangeEvent>(_onChange);
    on<AccountInformationSaveEvent>(_onSave);
    on<AccountInformationConnectEvent>(_onConnect);
  }

  void _onInit(AccountInformationInitEvent event, emit) async {
    emit(const AccountInformationLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(AccountInformationLoadDoneState('centalki.dev@gmail.com', '0918111111', DateTime(2023, 08, 17), 'female'));
  }

  void _onChange(AccountInformationChangeEvent event, emit) {
    emit(const AccountInformationInitState());
    emit(const AccountInformationChangingState());
  }

  void _onSave(AccountInformationSaveEvent event, emit) async {
    emit(const AccountInformationSavingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const AccountInformationSaveDoneState());
  }

  void _onConnect(AccountInformationConnectEvent event, emit) {
    emit(const AccountInformationChangingState());
  }
}
