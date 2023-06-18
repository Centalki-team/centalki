import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../../../bookmark/topic/domain/usecases/create_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/delete_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/params/create_bookmark_topic_params.dart';
import '../../../../tracking/tracking.dart';
import '../../../domain/entities/topic_item_entity.dart';
import '../../../domain/repositories/topic_repository.dart';
import '../../../domain/usecases/get_topics_usecase.dart';
import '../../../domain/usecases/params/get_topics_params.dart';

part 'pre_intermediate_topics_event.dart';

part 'pre_intermediate_topics_state.dart';

/// PRE-INTERMEDIATE LEVEL ID: RA9HlzOCHavBC7UTVHjO

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
  final GetTopicsParams _getTopicsParams = const GetTopicsParams(
    levelId: 'RA9HlzOCHavBC7UTVHjO',
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
    emit(PreIntermediateTopicsLoadingState(
      isOverlay: event.isRefresh,
    ));

    final topics = await getTopicsUseCase(_getTopicsParams);

    emit(PreIntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: event.isRefresh,
    ));
    topics.fold(
      (l) => emit(
        PreIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) {
        _logViewItemList(r.topics ?? []);
        return emit(
          PreIntermediateTopicsLoadDoneState(
            logKey: 'pre_intermediate_topics',
            logName: 'Pre-Intermediate Topics',
            topics: r.topics ?? [],
          ),
        );
      },
    );
  }

  void _onAddFavorite(PreIntermediateTopicsAddFavoriteEvent event, emit) async {
    emit(const PreIntermediateTopicsLoadingState(isOverlay: true));
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    emit(const PreIntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
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
    emit(const PreIntermediateTopicsLoadingState(isOverlay: true));
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const PreIntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
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

  void _logViewItemList(List<TopicItemEntity> items) {
    Analytics.inst?.ecommerce(
      (logger) => logger?.logViewItemList(
        itemListId: 'pre_intermediate_topics',
        itemListName: 'Pre-Intermediate Topics',
        items: items
            .map((e) => EcommerceItem(
                  itemId: e.topicId,
                  itemName: e.topicName,
                  itemCategory: e.topicCategory,
                ))
            .toList(),
      ),
    );
  }
}
