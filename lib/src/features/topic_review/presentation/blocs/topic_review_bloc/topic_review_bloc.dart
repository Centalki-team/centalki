import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/topic_feedback_data_entity.dart';
import '../../../domain/entities/topic_feedback_options_entity.dart';
import '../../../domain/entities/topic_feedback_response_entity.dart';
import '../../../domain/repositories/topic_review_pages_repository.dart';
import '../../../domain/usecases/get_topic_review_page_contents_usecase.dart';
import '../../../domain/usecases/params/send_topic_feedback_params.dart';
import '../../../domain/usecases/send_topic_feedback_usecase.dart';

part 'topic_review_event.dart';
part 'topic_review_state.dart';

class TopicReviewBloc extends Bloc<TopicReviewEvent, TopicReviewState> {
  TopicReviewBloc() : super(const TopicReviewInitState()) {
    on<TopicReviewLoadOptionsEvent>(_onLoadTopicFeedbackOptions);
    on<TopicReviewSendFeedbackEvent>(_onSendFeedback);
    add(const TopicReviewLoadOptionsEvent());
  }

  final _getTopicReviewOptionsUseCase = GetTopicReviewPageContentsUseCase(
      topicReviewPagesRepository: getIt.get<TopicReviewPagesRepository>());
  final _sendTopicFeedbackUseCase = SendTopicFeedbackUseCase(
      topicReviewPagesRepository: getIt.get<TopicReviewPagesRepository>());

  _onLoadTopicFeedbackOptions(TopicReviewLoadOptionsEvent event, emit) async {
    emit(const TopicReviewLoadingState());
    final res = await _getTopicReviewOptionsUseCase(null);
    emit(const TopicReviewLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        TopicReviewErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        TopicReviewOptionsLoadedState(
          topicFeedbackOptionsEntity: r,
        ),
      ),
    );
  }

  _onSendFeedback(TopicReviewSendFeedbackEvent event, emit) async {
    emit(const TopicReviewLoadingState());
    final res = await _sendTopicFeedbackUseCase(SendTopicFeedbackParams(
      topicId: event.topicFeedbackDataEntity.topicId,
      topicNameDetail: event.topicFeedbackDataEntity.nameFbDetail,
      topicPhotoDetail: event.topicFeedbackDataEntity.picFbDetail,
      topicDescriptionDetail: event.topicFeedbackDataEntity.descriptionFbDetail,
      topicVocabDetail: event.topicFeedbackDataEntity.vocabFbDetail,
      topicQuestionDetail: event.topicFeedbackDataEntity.qnaFbDetail,
      topicNameSummary:
          event.topicFeedbackDataEntity.nameFb.map((e) => e.key).toList(),
      topicPhotoSummary:
          event.topicFeedbackDataEntity.picFb.map((e) => e.key).toList(),
      topicDescriptionSummary: event.topicFeedbackDataEntity.descriptionFb
          .map((e) => e.key)
          .toList(),
      topicVocabSummary:
          event.topicFeedbackDataEntity.vocabFb.map((e) => e.key).toList(),
      topicQuestionSummary: event.topicFeedbackDataEntity.descriptionFb
          .map((e) => e.key)
          .toList(),
    ));
    emit(const TopicReviewLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        TopicReviewErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        TopicReviewSendFeedbackDoneState(
          topicFeedbackResponseEntity: r,
        ),
      ),
    );
  }
}
