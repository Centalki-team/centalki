import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/self_review/self_level_entity.dart';
import '../../../domain/repositories/sign_up_repo/sign_up_repository.dart';
import '../../../domain/usecases/sign_up_usecase/params/set_initial_level_params.dart';
import '../../../domain/usecases/sign_up_usecase/set_initial_level_usecase.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitState()) {
    on<SignUpInitEvent>(_onInit);
    on<SignUpValidateEvent>(_onValidate);
    on<SignUpSubmitEvent>(_onSubmit);
    on<SignUpUpdateInitialLevel>(_onUpdateInitLevel);
  }

  final SetInitialLevelUseCase _setInitialLevelUseCase =
      SetInitialLevelUseCase(signUpRepository: getIt.get<SignUpRepository>());

  void _onInit(SignUpInitEvent event, emit) {}

  void _onValidate(SignUpValidateEvent event, emit) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
    );

    var fullnameError = '';
    var emailError = '';
    var passwordError = '';
    var retypePasswordError = '';
    var termsError = '';
    var signUpButtonDisabled = false;

    if (event.fullname.isEmpty) {
      fullnameError = TextDoc.txtFullNameEmpty;
    } else if (event.fullname.replaceAll(' ', '').length < 2) {
      fullnameError = TextDoc.txtFullNameTooShort;
    } else if (event.fullname.length > 50) {
      fullnameError = TextDoc.txtFullNameTooLong;
    }

    if (event.email.isEmpty) {
      emailError = TextDoc.txtEmailEmpty;
    } else if (emailRegExp.hasMatch(event.email) == false) {
      emailError = TextDoc.txtEmailInvalidFormat;
    }

    if (event.password.isEmpty) {
      passwordError = TextDoc.txtPasswordEmpty;
    } else if (event.password.length < 6) {
      passwordError = TextDoc.txtPasswordTooShort;
    } else if (event.password.length > 100) {
      passwordError = TextDoc.txtPasswordTooLong;
    }

    if (event.retypePassword.isEmpty) {
      retypePasswordError = TextDoc.txtRetypePasswordEmpty;
    } else if (event.retypePassword != event.password) {
      retypePasswordError = TextDoc.txtRetypePasswordNotMatch;
    }

    if (event.isTermsAccepted == false) {
      termsError = TextDoc.txtTermsNotAgreed;
    }

    signUpButtonDisabled = fullnameError.isNotEmpty ||
        emailError.isNotEmpty ||
        passwordError.isNotEmpty ||
        retypePasswordError.isNotEmpty ||
        termsError.isNotEmpty;

    emit(SignUpValidateState(
      fullnameError: fullnameError,
      emailError: emailError,
      passwordError: passwordError,
      retypePasswordError: retypePasswordError,
      termsError: termsError,
      forceDisabled: signUpButtonDisabled,
    ));
  }

  void _onSubmit(SignUpSubmitEvent event, emit) async {
    emit(const SignUpLoadingState());

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );
      await credential.user
          ?.getIdToken()
          .then((id) => DioClient.assignRole(id, event.fullname));
      emit(const SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          emit(const SignUpErrorState(message: TextDoc.txtWeakPassword));
          break;
        case 'email-already-in-use':
          emit(const SignUpErrorState(message: TextDoc.txtEmailUsed));
          break;
        default:
          emit(SignUpErrorState(message: e.message ?? "Something went wrong!"));
          break;
      }
    } on DioError catch (_) {
      emit(const SignUpErrorState(message: TextDoc.txtNotValidateRole));
    }
  }

  _onUpdateInitLevel(SignUpUpdateInitialLevel event, emit) async {
    emit(const SetInitLevelLoadingState());
    final res = await _setInitialLevelUseCase(SetInitialLevelUseCaseParams(
      initialLevelId: event.initLevel.id.isNotEmpty ? event.initLevel.id : null,
      initialLevelType: event.initLevel.levelType,
    ));
    emit(const SetInitLevelLoadingState(showLoading: false));
    res.fold(
      (l) => emit(SetInitialLevelErrorState(
        exception: l,
      )),
      (r) => emit(const SetInitialLevelDoneState()),
    );
  }
}
