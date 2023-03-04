import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../domain/entities/user_account_entity.dart';
import '../../../domain/usecases/get_account_local_data_usecase.dart';

part 'your_account_event.dart';
part 'your_account_state.dart';

class YourAccountBloc extends Bloc<YourAccountEvent, YourAccountState> {
  YourAccountBloc() : super(const YourAccountInitState()) {
    on<YourAccountInitEvent>(_onInit);
    on<YourAccountLoadEvent>(_onLoad);
    on<YourAccountLogOutEvent>(_onLogOut);
  }

  final GetAccountLocalDataUseCase getAccountLocalDataUseCase =
      const GetAccountLocalDataUseCase();

  void _onInit(YourAccountInitEvent event, emit) {}

  void _onLoad(YourAccountLoadEvent event, emit) async {
    emit(const YourAccountLoadingState());
    try {
      final userProfile = await FirebaseAuth.instance.currentUser
          ?.getIdToken()
          .then(DioClient.getUserInformation);
      emit(YourAccountLoadDoneState(userProfile ?? const UserAccountEntity()));
    } on Exception catch (e) {
      emit(YourAccountLoadErrorState(e.toString()));
    }
  }

  void _onLogOut(YourAccountLogOutEvent event, emit) async {
    await FirebaseAuth.instance.signOut();
  }
}
