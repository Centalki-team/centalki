import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../di/di_module.dart';
import '../../../../account/domain/entities/user_account_entity.dart';
import '../../../../bookmark/topic/domain/entities/bookmark_topic_entity.dart';
import '../../../../bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../../../bookmark/topic/domain/usecases/create_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/delete_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/get_bookmark_topics_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/params/create_bookmark_topic_params.dart';
import '../../../../bookmark/topic/domain/usecases/params/delete_bookmark_topic_params.dart';
import '../../../../topic_detail/domain/entities/topic_detail_entity.dart';
import '../../../domain/entities/topic_item_entity.dart';
import '../../../domain/repositories/topic_repository.dart';
import '../../../domain/usecases/get_topics_usecase.dart';

part 'pre_intermediate_topics_event.dart';

part 'pre_intermediate_topics_state.dart';

class PreIntermediateTopicsBloc
    extends Bloc<PreIntermediateTopicsEvent, PreIntermediateTopicsState> {
  PreIntermediateTopicsBloc() : super(const TopicsInitState()) {
    on<PreIntermediateTopicsInitEvent>(_onInit);
    on<PreIntermediateTopicsLoadEvent>(_onLoad);
    on<PreIntermediateTopicsAddFavoriteEvent>(_onAddFavorite);
    on<PreIntermediateTopicsRemoveFavoriteEvent>(_onRemoveFavorite);
    add(const PreIntermediateTopicsInitEvent());
  }

  final GetTopicsUseCase getTopicsUseCase = GetTopicsUseCase(
    topicRepository: getIt.get<TopicRepository>(),
  );

  final CreateBookmarkTopicUseCase createBookmarkTopicUseCase =
      CreateBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final GetBookmarkTopicsUseCase getBookmarkTopicsUseCase =
      GetBookmarkTopicsUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(PreIntermediateTopicsInitEvent event, emit) {
    add(const PreIntermediateTopicsLoadEvent());
  }

  void _onLoad(PreIntermediateTopicsLoadEvent event, emit) async {
    emit(const PreIntermediateTopicsLoadingState());

    final res = await getBookmarkTopicsUseCase(null);
    var favoriteTopics = <String>[];
    res.fold(
      (l) => emit(
        PreIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => favoriteTopics = r.map((e) => e.bookmarkTopicId ?? '').toList(),
    );

    final topics = await getTopicsUseCase(null);
    emit(const PreIntermediateTopicsLoadingState(showLoading: false));
    topics.fold(
      (l) => emit(
        PreIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        PreIntermediateTopicsLoadDoneState(
          topics: r.topics ?? [],
          interestedTopics: favoriteTopics,
        ),
      ),
    );
  }

  void _onAddFavorite(PreIntermediateTopicsAddFavoriteEvent event, emit) async {
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    result.fold(
        (l) => emit(
              PreIntermediateTopicsErrorState(
                exception: l,
              ),
            ),
        (r) => {});
  }

  void _onRemoveFavorite(
      PreIntermediateTopicsRemoveFavoriteEvent event, emit) async {
    final result = await deleteBookmarkTopicUseCase(
        DeleteBookmarkTopicParams(id: event.id));
    result.fold(
        (l) => emit(
              PreIntermediateTopicsErrorState(
                exception: l,
              ),
            ),
        (r) => {});
  }
}
