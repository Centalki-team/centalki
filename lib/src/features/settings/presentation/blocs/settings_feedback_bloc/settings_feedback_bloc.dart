import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/repositories/feedback_repository.dart';
import '../../../domain/usecases/create_feedback_params.dart';
import '../../../domain/usecases/create_feedback_usecase.dart';

part 'settings_feedback_event.dart';
part 'settings_feedback_state.dart';

class SettingsFeedbackBloc
    extends Bloc<SettingsFeedbackEvent, SettingsFeedbackState> {
  SettingsFeedbackBloc() : super(const SettingsFeedbackInitState()) {
    on<SettingsFeedbackInitEvent>(_onInit);
    on<SettingsFeedbackValidateEvent>(_onValidate);
    on<SettingsFeedbackSendEvent>(_onSettingsFeedback);
  }

  final CreateFeedbackUseCase createFeedbackUseCase = CreateFeedbackUseCase(
    feedbackRepository: getIt.get<FeedbackRepository>(),
  );

  void _onInit(SettingsFeedbackInitEvent event, emit) {}

  void _onValidate(SettingsFeedbackValidateEvent event, emit) {
    var ratingError = '';
    var feedbackError = '';

    if (event.rating == 0) {
      ratingError = TextDoc.txtRatingEmpty;
    }

    if (event.feedback.isEmpty) {
      feedbackError = TextDoc.txtFeedbackEmpty;
    } else if (event.feedback.length > 500) {
      feedbackError = TextDoc.txtFeedbackTooLong;
    }

    emit(SettingsFeedbackValidateState(
        ratingError: ratingError,
        feedbackError: feedbackError,
        forceDisabled: ratingError.isNotEmpty || feedbackError.isNotEmpty));
  }

  void _onSettingsFeedback(SettingsFeedbackSendEvent event, emit) async {
    emit(const SettingsFeedbackLoadingState());
    final feedback = Map<String, dynamic>.from(
        {"rating": event.rating, "text": event.feedback});

    final isCreated =
        await createFeedbackUseCase(CreateFeedbackParams(feedback: feedback));
    isCreated.fold(
      (l) => emit(
        SettingsFeedbackLoadErrorState(
          l,
        ),
      ),
      (r) => emit(
        const SettingsFeedbackLoadDoneState(),
      ),
    );
  }
}
