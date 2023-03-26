part of 'settings_feedback_bloc.dart';

abstract class SettingsFeedbackState {
  const SettingsFeedbackState();
}

class SettingsFeedbackInitState extends SettingsFeedbackState {
  const SettingsFeedbackInitState();
}

class SettingsFeedbackLoadingState extends SettingsFeedbackState {
  const SettingsFeedbackLoadingState();
}

class SettingsFeedbackLoadDoneState extends SettingsFeedbackState {
  const SettingsFeedbackLoadDoneState();
}

class SettingsFeedbackLoadErrorState extends SettingsFeedbackState {
  const SettingsFeedbackLoadErrorState(this.exception);

  final AppException exception;
}

class SettingsFeedbackValidateState extends SettingsFeedbackState {
  const SettingsFeedbackValidateState({
    required this.ratingError,
    required this.feedbackError,
    required this.forceDisabled,
  });

  final String ratingError;
  final String feedbackError;
  final bool forceDisabled;
}
