import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/locale_manager.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/repositories/application_repository.dart';
import '../../../domain/usecases/get_application_locale_usecase.dart';
import '../../../domain/usecases/save_application_locale_usecase.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationLocaleChanged>(_onLocaleChanged);
  }

  final GetApplicationLocaleUseCase _getApplicationLocaleUseCase =
      GetApplicationLocaleUseCase(
          applicationRepository: getIt.get<ApplicationRepository>());
  final SaveApplicationLocaleUseCase _saveApplicationLocaleUseCase =
      SaveApplicationLocaleUseCase(
          applicationRepository: getIt.get<ApplicationRepository>());

  _onLoaded(ApplicationLoaded event, emit) async {
    emit(state.copyWith(
      status: UIStatus.loading,
    ));

    final savedLocale = await _getApplicationLocaleUseCase(null);

    await S.load(Locale(savedLocale));

    //AppLocaleManager.appCurrentLocale!.add(Locale(savedLocale));

    emit(state.copyWith(
      status: UIStatus.loadSuccess,
      locale: savedLocale,
    ));
  }

  _onLocaleChanged(ApplicationLocaleChanged event, emit) async {
    if (state.locale != event.locale) {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));

      await S.load(Locale(event.locale));

      await _saveApplicationLocaleUseCase(event.locale);

      //AppLocaleManager.appCurrentLocale!.add(Locale(event.locale));

      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        locale: event.locale,
      ));
    }
  }
}
