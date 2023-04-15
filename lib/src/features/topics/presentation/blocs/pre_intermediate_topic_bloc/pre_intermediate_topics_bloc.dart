import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../../../bookmark/topic/domain/usecases/create_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/delete_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/params/create_bookmark_topic_params.dart';
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

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(PreIntermediateTopicsInitEvent event, emit) {
    add(const PreIntermediateTopicsLoadEvent());
  }

  void _onLoad(PreIntermediateTopicsLoadEvent event, emit) async {
    emit(const PreIntermediateTopicsLoadingState());

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
        ),
      ),
    );
  }

  void _onAddFavorite(PreIntermediateTopicsAddFavoriteEvent event, emit) async {
    emit(const PreIntermediateTopicsLoadingState());
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    emit(const PreIntermediateTopicsLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        PreIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const PreIntermediateTopicsAddFavoriteDoneState(),
      ),
    );
  }

  void _onRemoveFavorite(
      PreIntermediateTopicsRemoveFavoriteEvent event, emit) async {
    emit(const PreIntermediateTopicsLoadingState());
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const PreIntermediateTopicsLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        PreIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const PreIntermediateTopicsRemoveFavoriteDoneState(),
      ),
    );
  }
}
