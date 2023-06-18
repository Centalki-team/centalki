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

part 'upper_intermediate_topics_event.dart';
part 'upper_intermediate_topics_state.dart';

/// UPPER-INTERMEDIATE LEVEL ID: ZyPTZVkn2bG8zLHbdAUW

class UpperIntermediateTopicsBloc
    extends Bloc<UpperIntermediateTopicsEvent, UpperIntermediateTopicsState> {
  UpperIntermediateTopicsBloc()
      : super(const UpperIntermediateTopicsInitState()) {
    on<UpperIntermediateTopicsInitEvent>(_onInit);
    on<UpperIntermediateTopicsLoadEvent>(_onLoad);
    on<UpperIntermediateTopicsAddFavoriteEvent>(_onAddFavorite);
    on<UpperIntermediateTopicsRemoveFavoriteEvent>(_onRemoveFavorite);
    add(const UpperIntermediateTopicsInitEvent());
  }

  final GetTopicsUseCase getTopicsUseCase = GetTopicsUseCase(
    topicRepository: getIt.get<TopicRepository>(),
  );
  final GetTopicsParams _getTopicsParams = const GetTopicsParams(
    levelId: 'ZyPTZVkn2bG8zLHbdAUW',
  );

  final CreateBookmarkTopicUseCase createBookmarkTopicUseCase =
      CreateBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(UpperIntermediateTopicsInitEvent event, emit) {
    add(const UpperIntermediateTopicsLoadEvent());
  }

  void _onLoad(UpperIntermediateTopicsLoadEvent event, emit) async {
    emit(UpperIntermediateTopicsLoadingState(isOverlay: event.isRefresh));

    final topics = await getTopicsUseCase(_getTopicsParams);

    emit(UpperIntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: event.isRefresh,
    ));
    topics.fold(
      (l) => emit(
        UpperIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) {
        _logViewItemList(r.topics ?? []);
        return emit(
          UpperIntermediateTopicsLoadDoneState(
            logKey: 'upper_intermediate_topics',
            logName: 'Upper-Intermediate Topics',
            topics: r.topics ?? [],
          ),
        );
      },
    );
  }

  void _onAddFavorite(
      UpperIntermediateTopicsAddFavoriteEvent event, emit) async {
    emit(const UpperIntermediateTopicsLoadingState(isOverlay: true));
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    emit(const UpperIntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
    result.fold(
      (l) => emit(
        UpperIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const UpperIntermediateTopicsAddFavoriteDoneState(),
      ),
    );
  }

  void _onRemoveFavorite(
      UpperIntermediateTopicsRemoveFavoriteEvent event, emit) async {
    emit(const UpperIntermediateTopicsLoadingState(isOverlay: true));
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const UpperIntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
    result.fold(
      (l) => emit(
        UpperIntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const UpperIntermediateTopicsRemoveFavoriteDoneState(),
      ),
    );
  }

  void _logViewItemList(List<TopicItemEntity> items) {
    Analytics.inst?.ecommerce(
      (logger) => logger?.logViewItemList(
        itemListId: 'upper_intermediate_topics',
        itemListName: 'Upper-Intermediate Topics',
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
