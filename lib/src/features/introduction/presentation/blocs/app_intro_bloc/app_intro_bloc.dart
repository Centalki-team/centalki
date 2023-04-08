import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../di/di_module.dart';
import '../../../domain/entities/app_intro_entity.dart';
import '../../../domain/repositories/app_intro_repository.dart';
import '../../../domain/usecases/get_app_intros_usecase.dart';
import '../../../domain/usecases/get_status_app_intro_usecase.dart';
import '../../../domain/usecases/save_status_app_intro_usecase.dart';

part 'app_intro_event.dart';
part 'app_intro_state.dart';

class AppIntroBloc extends Bloc<AppIntroEvent, AppIntroState> {
  AppIntroBloc() : super(const AppIntroInitState()) {
    on<AppIntroLoadEvent>(_onLoadAppIntros);
    on<AppIntroScrollEvent>(_onAppIntrosScroll);
    on<AppIntroConfirmEvent>(_onAppIntroConfirm);
  }

  final GetAppIntrosUseCase getAppIntrosUseCase =
      GetAppIntrosUseCase(appIntroRepository: getIt.get<AppIntroRepository>());
  final GetStatusAppIntroUseCase getStatusAppIntroUseCase =
      GetStatusAppIntroUseCase(
          appIntroRepository: getIt.get<AppIntroRepository>());
  final SaveStatusAppIntroUseCase saveStatusAppIntroUseCase =
      SaveStatusAppIntroUseCase(
          appIntroRepository: getIt.get<AppIntroRepository>());

  _onLoadAppIntros(AppIntroLoadEvent event, emit) async {
    final appIntros = await getAppIntrosUseCase(null);
    emit(AppIntroLoadedState(appIntros: appIntros));
  }

  _onAppIntrosScroll(AppIntroScrollEvent event, emit) =>
      emit(AppIntroPageIndexChangeState(
        currentIndex: event.index,
      ));

  _onAppIntroConfirm(AppIntroConfirmEvent event, emit) async {
    await saveStatusAppIntroUseCase(null);
  }
}
