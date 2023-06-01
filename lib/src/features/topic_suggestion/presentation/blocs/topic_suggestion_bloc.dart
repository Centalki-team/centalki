import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/topic_suggestion_content_entity.dart';
import '../../domain/repositories/topic_suggestion_repository.dart';
import '../../domain/usecases/get_topic_suggestion_contents_usecase.dart';
import '../../domain/usecases/params/send_topic_suggestion_params.dart';
import '../../domain/usecases/send_topic_suggestion_usecase.dart';

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

  final GetTopicSuggestionContentsUseCase getTopicSuggestionContentsUseCase =
      GetTopicSuggestionContentsUseCase(
    topicSuggestionRepository: getIt.get<TopicSuggestionRepository>(),
  );

  final SendTopicSuggestionUseCase sendTopicSuggestionUseCase =
      SendTopicSuggestionUseCase(
    topicSuggestionRepository: getIt.get<TopicSuggestionRepository>(),
  );

  void _onInit(TopicSuggestionInitEvent event, emit) {
    add(const TopicSuggestionLoadEvent());
  }

  void _onLoad(TopicSuggestionLoadEvent event, emit) async {
    emit(const TopicSuggestionLoadingState());

    final contents = await getTopicSuggestionContentsUseCase(null);

    emit(const TopicSuggestionLoadingState(showLoading: false));

    contents.fold(
      (l) => emit(
        TopicSuggestionLoadFailedState(
          exception: l,
        ),
      ),
      (r) => emit(
        TopicSuggestionLoadDoneState(
          contents: r,
        ),
      ),
    );
  }

  void _onValidate(TopicSuggestionValidateEvent event, emit) {
    var subjectError = '';
    var descriptionError = '';

    if (event.subjectAndCategory.isEmpty) {
      subjectError = S.current.txtSubjectNotEmpty;
    } else if (event.subjectAndCategory.length > 200) {
      subjectError = S.current.txtSubjectTooLong;
    }

    if (event.descriptionAndRequirements.length > 500) {
      descriptionError = S.current.txtDescriptionAndRequirementsTooLong;
    }

    emit(TopicSuggestionValidateState(
        subjectError: subjectError,
        descriptionError: descriptionError,
        forceDisabled: subjectError.isNotEmpty || descriptionError.isNotEmpty));
  }

  void _onSendSessionFeedback(TopicSuggestionSendEvent event, emit) async {
    emit(const TopicSuggestionSendingState());

    final res = await sendTopicSuggestionUseCase(SendTopicSuggestionParams(
      subject: event.subjectAndCategory,
      description: event.descriptionAndRequirements,
      difficulty: event.selectedLevel,
    ));

    res.fold(
      (l) => emit(
        TopicSuggestionSendErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const TopicSuggestionSendDoneState(),
      ),
    );
  }
}
