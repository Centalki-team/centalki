part of 'settings_feedback_bloc.dart';

abstract class SettingsFeedbackEvent {
  const SettingsFeedbackEvent();
}

class SettingsFeedbackInitEvent extends SettingsFeedbackEvent {
  const SettingsFeedbackInitEvent();
}

class SettingsFeedbackValidateEvent extends SettingsFeedbackEvent {
  const SettingsFeedbackValidateEvent({
    required this.rating,
    required this.feedback,
  });

  final double rating;
  final String feedback;
}

class SettingsFeedbackSendEvent extends SettingsFeedbackEvent {
  const SettingsFeedbackSendEvent({
    required this.rating,
    required this.feedback,
  });

  final double rating;
  final String feedback;
}
