import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/helpers/time_helper.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../domain/entities/user_account_entity.dart';

part 'account_information_event.dart';
part 'account_information_state.dart';

class AccountInformationBloc
    extends Bloc<AccountInformationEvent, AccountInformationState> {
  AccountInformationBloc() : super(const AccountInformationInitState()) {
    on<AccountInformationInitEvent>(_onInit);
    on<AccountInformationChangeEvent>(_onChange);
    on<AccountInformationSaveEvent>(_onSave);
    on<AccountInformationConnectEvent>(_onConnect);
  }

  void _onInit(AccountInformationInitEvent event, emit) async {
    try {
      emit(const AccountInformationLoadingState());
      final accountInformation = await FirebaseAuth.instance.currentUser
          ?.getIdToken()
          .then(DioClient.getUserInformation);
      emit(AccountInformationLoadDoneState(
          accountInformation?.accountEmail ?? '',
          accountInformation?.accountPhoneNumber ?? '',
          accountInformation?.userProfile?.dateOfBirth ?? DateTime.now(),
          accountInformation?.userProfile?.accountGender ?? Gender.male));
    } on Exception catch (e) {
      emit(AccountInformationLoadFailureState('$e'));
    }
  }

  void _onChange(AccountInformationChangeEvent event, emit) {
    emit(const AccountInformationChangingState());
  }

  void _onSave(AccountInformationSaveEvent event, emit) async {
    emit(const AccountInformationSavingState());
    try {
      final updateInformation = Map<String, dynamic>.from({
        "dob": DateTimeHelper.timeToString3(event.dateOfBirth),
        "gender": event.gender.name.toUpperCase()
      });
      var idToken = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      final isSuccess =
          await DioClient.updateUserInformation(updateInformation, idToken);
      if (isSuccess) {
        emit(const AccountInformationSaveDoneState());
      } else {
        throw Exception();
      }
    } on Exception catch (_) {
      emit(const AccountInformationSaveFailureState(TextDoc.txtSaveFailed));
    }
  }

  void _onConnect(AccountInformationConnectEvent event, emit) {
    emit(const AccountInformationChangingState());
  }
}
