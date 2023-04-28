import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';

part 'topic_suggestion_event.dart';
part 'topic_suggestion_state.dart';

class TopicSuggestionBloc
    extends Bloc<TopicSuggestionEvent, TopicSuggestionState> {
  TopicSuggestionBloc() : super(const TopicSuggestionInitState()) {
    on<TopicSuggestionInitEvent>(_onInit);
    on<TopicSuggestionLoadEvent>(_onLoad);
    on<TopicSuggestionValidateEvent>(_onValidate);
    on<TopicSuggestionSendEvent>(_onSendSessionFeedback);
    add(const TopicSuggestionInitEvent());
  }

  // final GetSessionFeedbackContentUseCase getSessionFeedbackContentUseCase =
  //     GetSessionFeedbackContentUseCase(
  //   sessionFeedbackRepository: getIt.get<SessionFeedbackRepository>(),
  // );

  // final CreateSessionFeedbackUseCase createSessionFeedbackUseCase =
  //     CreateSessionFeedbackUseCase(
  //   sessionFeedbackRepository: getIt.get<SessionFeedbackRepository>(),
  // );

  void _onInit(TopicSuggestionInitEvent event, emit) {
    add(const TopicSuggestionLoadEvent());
  }

  void _onLoad(TopicSuggestionLoadEvent event, emit) async {
    emit(const TopicSuggestionLoadingState());

    // final contents = await getSessionFeedbackContentUseCase(null);
    final contents = [
      'Elementary',
      'Pre-Intermediate',
      'Intermediate',
      'Upper-Intermediate',
      'Shouldn\'t be too hard',
      'Shouldn\'t be too easy',
      'I\'m not sure, any level would be fine',
    ];
    emit(const TopicSuggestionLoadingState(showLoading: false));
    emit(TopicSuggestionLoadDoneState(
      contents: contents,
    ));
    // contents.fold(
    //   (l) => emit(
    //     TopicSuggestionLoadFailedState(
    //       exception: l,
    //     ),
    //   ),
    //   (r) => emit(
    //     TopicSuggestionLoadDoneState(
    //       contents: r,
    //     ),
    //   ),
    // );
  }

  void _onValidate(TopicSuggestionValidateEvent event, emit) {
    var subjectError = '';
    var descriptionError = '';

    if (event.subjectAndCategory.isEmpty) {
      subjectError = TextDoc.txtSubjectNotEmpty;
    } else if (event.subjectAndCategory.length > 200) {
      subjectError = TextDoc.txtSubjectTooLong;
    }

    if (event.descriptionAndRequirements.length > 500) {
      descriptionError = TextDoc.txtDescriptionAndRequirementsTooLong;
    }

    emit(TopicSuggestionValidateState(
        subjectError: subjectError,
        descriptionError: descriptionError,
        forceDisabled: subjectError.isNotEmpty || descriptionError.isNotEmpty));
  }

  void _onSendSessionFeedback(TopicSuggestionSendEvent event, emit) async {
    // emit(const TopicSuggestionSendingState());

    // final res = await createSessionFeedbackUseCase(CreateSessionFeedbackParams(
    //   sessionId: event.sessionId,
    //   rating: event.rating,
    //   satisfiedWith: event.summaryLevel,
    //   notSatisfiedWith: event.summaryNotSatisfied,
    //   description: event.subjectAndCategory,
    //   notSatisfiedDetail: event.descriptionAndRequirements,
    //   suggestForTeacher: event.suggestions,
    // ));
    // res.fold(
    //   (l) => emit(
    //     TopicSuggestionSendErrorState(
    //       exception: l,
    //     ),
    //   ),
    //   (r) => emit(
    //     const TopicSuggestionSendDoneState(),
    //   ),
    // );
  }
}
