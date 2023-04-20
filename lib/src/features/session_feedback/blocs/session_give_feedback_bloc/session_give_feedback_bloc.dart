import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/gateway/exception/app_exception.dart';

part 'session_give_feedback_event.dart';
part 'session_give_feedback_state.dart';

class SessionGiveFeedbackBloc
    extends Bloc<SessionGiveFeedbackEvent, SessionGiveFeedbackState> {
  SessionGiveFeedbackBloc() : super(const SessionGiveFeedbackInitState()) {
    on<SessionGiveFeedbackInitEvent>(_onInit);
    on<SessionGiveFeedbackValidateEvent>(_onValidate);
    on<SessionGiveFeedbackSendEvent>(_onSessionGiveFeedback);
  }

  void _onInit(SessionGiveFeedbackInitEvent event, emit) {}

  void _onValidate(SessionGiveFeedbackValidateEvent event, emit) {
    var ratingError = '';
    var satisfiedChipError = '';
    var satisfiedDescriptionError = '';
    var notSatisfiedChipError = '';
    var notSatisfiedDescriptionError = '';
    var suggestionsError = '';

    if (event.rating == 0) {
      ratingError = TextDoc.txtRatingEmpty;
    }

    if (!event.selectedSatisfied.contains(true)) {
      satisfiedChipError = TextDoc.txtSatisfiedChipNotEmpty;
    }

    if (!event.selectedNotSatisfied.contains(true)) {
      notSatisfiedChipError = TextDoc.txtSatisfiedChipNotEmpty;
    }

    if (event.satisfiedDescription.length > 500) {
      satisfiedDescriptionError = TextDoc.txtDescriptionTooLong;
    }

    if (event.notSatisfiedDescription.length > 500) {
      notSatisfiedDescriptionError = TextDoc.txtDescriptionTooLong;
    }

    if (event.suggestions.length > 500) {
      suggestionsError = TextDoc.txtSuggestionsTooLong;
    }

    emit(SessionGiveFeedbackValidateState(
        ratingError: ratingError,
        satisfiedChipError: satisfiedChipError,
        satisfiedDescriptionError: satisfiedDescriptionError,
        notSatisfiedChipError: notSatisfiedChipError,
        notSatisfiedDescriptionError: notSatisfiedDescriptionError,
        suggestionsError: suggestionsError,
        forceDisabled: ratingError.isNotEmpty ||
            satisfiedChipError.isNotEmpty ||
            satisfiedDescriptionError.isNotEmpty ||
            notSatisfiedChipError.isNotEmpty ||
            notSatisfiedDescriptionError.isNotEmpty ||
            suggestionsError.isNotEmpty));
  }

  void _onSessionGiveFeedback(SessionGiveFeedbackSendEvent event, emit) async {
    // emit(const SessionGiveFeedbackLoadingState());
    // final feedback = Map<String, dynamic>.from(
    //     {"rating": event.rating, "text": event.feedback});

    // final isCreated =
    //     await createFeedbackUseCase(CreateFeedbackParams(feedback: feedback));
    // isCreated.fold(
    //   (l) => emit(
    //     SessionGiveFeedbackLoadErrorState(
    //       l,
    //     ),
    //   ),
    //   (r) => emit(
    //     const SessionGiveFeedbackLoadDoneState(),
    //   ),
    // );
  }
}
