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
import '../../../domain/usecases/params/get_topics_params.dart';

part 'elementary_topics_event.dart';
part 'elementary_topics_state.dart';

/// ELEMENTARY LEVEL ID: vRg39kQSgDLsA2HhGjGp

class ElementaryTopicsBloc
    extends Bloc<ElementaryTopicsEvent, ElementaryTopicsState> {
  ElementaryTopicsBloc() : super(const ElementaryTopicsInitState()) {
    on<ElementaryTopicsInitEvent>(_onInit);
    on<ElementaryTopicsLoadEvent>(_onLoad);
    on<ElementaryTopicsAddFavoriteEvent>(_onAddFavorite);
    on<ElementaryTopicsRemoveFavoriteEvent>(_onRemoveFavorite);
    add(const ElementaryTopicsInitEvent());
  }

  final GetTopicsUseCase getTopicsUseCase = GetTopicsUseCase(
    topicRepository: getIt.get<TopicRepository>(),
  );
  final GetTopicsParams _getTopicsParams = const GetTopicsParams(
    levelId: 'vRg39kQSgDLsA2HhGjGp',
  );

  final CreateBookmarkTopicUseCase createBookmarkTopicUseCase =
      CreateBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(ElementaryTopicsInitEvent event, emit) {
    add(const ElementaryTopicsLoadEvent());
  }

  void _onLoad(ElementaryTopicsLoadEvent event, emit) async {
    emit(ElementaryTopicsLoadingState(isOverlay: event.isRefresh));

    final topics = await getTopicsUseCase(_getTopicsParams);

    emit(ElementaryTopicsLoadingState(
      showLoading: false,
      isOverlay: event.isRefresh,
    ));
    topics.fold(
      (l) => emit(
        ElementaryTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        ElementaryTopicsLoadDoneState(
          topics: r.topics ?? [],
        ),
      ),
    );
  }

  void _onAddFavorite(ElementaryTopicsAddFavoriteEvent event, emit) async {
    emit(const ElementaryTopicsLoadingState(isOverlay: true));
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    emit(const ElementaryTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
    result.fold(
      (l) => emit(
        ElementaryTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const ElementaryTopicsAddFavoriteDoneState(),
      ),
    );
  }

  void _onRemoveFavorite(
      ElementaryTopicsRemoveFavoriteEvent event, emit) async {
    emit(const ElementaryTopicsLoadingState(isOverlay: true));
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const ElementaryTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
    result.fold(
      (l) => emit(
        ElementaryTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const ElementaryTopicsRemoveFavoriteDoneState(),
      ),
    );
  }
}
