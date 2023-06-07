import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../di/di_module.dart';
import '../../../../authentication/domain/repositories/log_out_repo/log_out_repository.dart';
import '../../../../authentication/domain/usecases/log_out_usecase/log_out_usecase.dart';
import '../../../../authentication/domain/usecases/log_out_usecase/params/log_out_params.dart';
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

  final LogOutUseCase _logOutUseCase =
      LogOutUseCase(logOutRepository: getIt.get<LogOutRepository>());

  void _onInit(YourAccountInitEvent event, emit) {}

  void _onLoad(YourAccountLoadEvent event, emit) async {
    emit(const YourAccountLoadingState());
    try {
      final userProfile = await FirebaseAuth.instance.currentUser
          ?.getIdToken()
          .then(DioClient.getUserInformation);
      emit(YourAccountLoadDoneState(userProfile ?? const UserAccountEntity()));
    } on Exception catch (_) {
      emit(
          const YourAccountLoadErrorState('Không thể tải thông tin tài khoản'));
    }
  }

  void _onLogOut(YourAccountLogOutEvent event, emit) async {
    final token = await FirebaseMessaging.instance.getToken();
    await _logOutUseCase(LogOutUseCaseParams(token: token!));

    var googleAccount = GoogleSignIn();
    googleAccount.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
