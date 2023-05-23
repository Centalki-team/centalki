import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../di/di_module.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/repositories/application_repository.dart';
import '../../../domain/usecases/get_application_locale_usecase.dart';
import '../../../domain/usecases/get_application_theme_usecase.dart';
import '../../../domain/usecases/save_application_locale_usecase.dart';
import '../../../domain/usecases/save_application_theme_usecase.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationLocaleChanged>(_onLocaleChanged);
    on<ApplicationDarkModeChanged>(_onThemeChanged);
  }

  final GetApplicationLocaleUseCase _getApplicationLocaleUseCase =
      GetApplicationLocaleUseCase(
          applicationRepository: getIt.get<ApplicationRepository>());
  final SaveApplicationLocaleUseCase _saveApplicationLocaleUseCase =
      SaveApplicationLocaleUseCase(
          applicationRepository: getIt.get<ApplicationRepository>());
  final GetApplicationThemeUseCase _getApplicationThemeUseCase =
      GetApplicationThemeUseCase(
          applicationRepository: getIt.get<ApplicationRepository>());
  final SaveApplicationThemeUseCase _saveApplicationThemeUseCase =
      SaveApplicationThemeUseCase(
          applicationRepository: getIt.get<ApplicationRepository>());

  _onLoaded(ApplicationLoaded event, emit) async {
    emit(state.copyWith(
      status: UIStatus.loading,
    ));

    final savedLocale = await _getApplicationLocaleUseCase(null);
    final savedTheme = await _getApplicationThemeUseCase(null);

    await S.load(Locale(savedLocale));

    //AppLocaleManager.appCurrentLocale!.add(Locale(savedLocale));

    emit(state.copyWith(
      status: UIStatus.loadSuccess,
      locale: savedLocale,
      isDarkMode: savedTheme,
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

  _onThemeChanged(ApplicationDarkModeChanged event, emit) async {
    if (state.isDarkMode != event.enable) {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));

      await _saveApplicationThemeUseCase(event.enable);

      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        isDarkMode: event.enable,
      ));
    }
  }
}
