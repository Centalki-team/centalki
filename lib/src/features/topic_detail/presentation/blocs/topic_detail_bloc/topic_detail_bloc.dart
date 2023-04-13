import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../di/di_module.dart';
import '../../../../bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../../../bookmark/topic/domain/usecases/create_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/delete_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/params/create_bookmark_topic_params.dart';
import '../../../../bookmark/topic/domain/usecases/params/delete_bookmark_topic_params.dart';
import '../../../domain/entities/topic_detail_entity.dart';

part 'topic_detail_event.dart';

part 'topic_detail_state.dart';

class TopicDetailBloc extends Bloc<TopicDetailEvent, TopicDetailState> {
  TopicDetailBloc() : super(const TopicDetailInitState()) {
    on<TopicDetailInitEvent>(_onInit);
    on<TopicDetailLoadEvent>(_onLoad);
    on<TopicDetailAddFavoriteEvent>(_onAddFavorite);
    on<TopicDetailRemoveFavoriteEvent>(_onRemoveFavorite);
    add(const TopicDetailInitEvent());
  }

  final CreateBookmarkTopicUseCase createBookmarkTopicUseCase =
      CreateBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(TopicDetailInitEvent event, emit) {}

  void _onLoad(TopicDetailLoadEvent event, emit) async {
    try {
      final topicDetail = await FirebaseAuth.instance.currentUser
              ?.getIdToken()
              .then((token) =>
                  DioClient.getTopicDetailById(event.topicId, token)) ??
          const TopicDetailEntity();
      emit(TopicDetailLoadDoneState(topicDetail: topicDetail));
    } on Exception catch (e) {
      emit(
          TopicDetailLoadFailedState(errorMessage: e.toString().substring(11)));
    }
  }

  void _onAddFavorite(TopicDetailAddFavoriteEvent event, emit) async {
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    result.fold(
        (l) => emit(
              TopicDetailLoadFailedState(
                errorMessage: l.toString(),
              ),
            ),
        (r) => {});
  }

  void _onRemoveFavorite(TopicDetailRemoveFavoriteEvent event, emit) async {
    final result = await deleteBookmarkTopicUseCase(
        DeleteBookmarkTopicParams(id: event.topicId));
    result.fold(
        (l) => emit(
              TopicDetailLoadFailedState(
                errorMessage: l.toString(),
              ),
            ),
        (r) => {});
  }
}
