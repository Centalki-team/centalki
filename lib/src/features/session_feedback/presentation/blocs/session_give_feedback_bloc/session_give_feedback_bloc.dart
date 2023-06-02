import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/entities/session_feedback_content_entity.dart';
import '../../../domain/repositories/session_feedback_repository.dart';
import '../../../domain/usecases/create_session_feedback_usecase.dart';
import '../../../domain/usecases/get_session_feedback_content_usecase.dart';
import '../../../domain/usecases/params/create_session_feedback_params.dart';

part 'session_give_feedback_event.dart';
part 'session_give_feedback_state.dart';

class SessionGiveFeedbackBloc
    extends Bloc<SessionGiveFeedbackEvent, SessionGiveFeedbackState> {
  SessionGiveFeedbackBloc() : super(const SessionGiveFeedbackInitState()) {
    on<SessionGiveFeedbackInitEvent>(_onInit);
    on<SessionGiveFeedbackLoadEvent>(_onLoad);
    on<SessionGiveFeedbackValidateEvent>(_onValidate);
    on<SessionGiveFeedbackSendEvent>(_onSendSessionFeedback);
    add(const SessionGiveFeedbackInitEvent());
  }

  final GetSessionFeedbackContentUseCase getSessionFeedbackContentUseCase =
      GetSessionFeedbackContentUseCase(
    sessionFeedbackRepository: getIt.get<SessionFeedbackRepository>(),
  );

  final CreateSessionFeedbackUseCase createSessionFeedbackUseCase =
      CreateSessionFeedbackUseCase(
    sessionFeedbackRepository: getIt.get<SessionFeedbackRepository>(),
  );

  void _onInit(SessionGiveFeedbackInitEvent event, emit) {
    add(const SessionGiveFeedbackLoadEvent());
  }

  void _onLoad(SessionGiveFeedbackLoadEvent event, emit) async {
    emit(const SessionGiveFeedbackLoadingState());

    final contents = await getSessionFeedbackContentUseCase(null);
    emit(const SessionGiveFeedbackLoadingState(showLoading: false));
    contents.fold(
      (l) => emit(
        SessionGiveFeedbackLoadFailedState(
          exception: l,
        ),
      ),
      (r) => emit(
        SessionGiveFeedbackLoadDoneState(
          contents: r,
        ),
      ),
    );
  }

  void _onValidate(SessionGiveFeedbackValidateEvent event, emit) {
    var ratingError = '';
    var satisfiedChipError = '';
    var satisfiedDescriptionError = '';
    var notSatisfiedChipError = '';
    var notSatisfiedDescriptionError = '';
    var suggestionsError = '';

    if (event.rating == 0) {
      ratingError = S.current.txtRatingEmptyError;
    }

    if (event.summarySatisfied.isEmpty) {
      satisfiedChipError = S.current.txtSatisfiedChipNotEmpty;
    } else if (event.summarySatisfied.contains('OTHERS') &&
        event.satisfiedDescription.isEmpty) {
      satisfiedDescriptionError = S.current.txtDescriptionNotEmpty;
    }

    if (event.summaryNotSatisfied.isEmpty) {
      notSatisfiedChipError = S.current.txtSatisfiedChipNotEmpty;
    } else if (event.summaryNotSatisfied.contains('OTHERS') &&
        event.notSatisfiedDescription.isEmpty) {
      notSatisfiedDescriptionError = S.current.txtDescriptionNotEmpty;
    }

    if (event.satisfiedDescription.length > 500) {
      satisfiedDescriptionError = S.current.txtDescriptionTooLong;
    }

    if (event.notSatisfiedDescription.length > 500) {
      notSatisfiedDescriptionError = S.current.txtDescriptionTooLong;
    }

    if (event.suggestions.length > 500) {
      suggestionsError = S.current.txtSuggestionsTooLong;
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

  void _onSendSessionFeedback(SessionGiveFeedbackSendEvent event, emit) async {
    emit(const SessionGiveFeedbackSendingState());

    final res = await createSessionFeedbackUseCase(CreateSessionFeedbackParams(
      sessionId: event.sessionId,
      rating: event.rating,
      satisfiedWith: event.summarySatisfied,
      notSatisfiedWith: event.summaryNotSatisfied,
      description: event.satisfiedDescription,
      notSatisfiedDetail: event.notSatisfiedDescription,
      suggestForTeacher: event.suggestions,
    ));
    res.fold(
      (l) => emit(
        SessionGiveFeedbackSendErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const SessionGiveFeedbackSendDoneState(),
      ),
    );
  }
}
