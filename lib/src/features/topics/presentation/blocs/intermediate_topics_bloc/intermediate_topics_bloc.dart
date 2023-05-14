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

part 'intermediate_topics_event.dart';
part 'intermediate_topics_state.dart';

/// INTERMEDIATE LEVEL ID: XY9JcJLnZU6usBppFrFH

class IntermediateTopicsBloc
    extends Bloc<IntermediateTopicsEvent, IntermediateTopicsState> {
  IntermediateTopicsBloc() : super(const IntermediateTopicsInitState()) {
    on<IntermediateTopicsInitEvent>(_onInit);
    on<IntermediateTopicsLoadEvent>(_onLoad);
    on<IntermediateTopicsAddFavoriteEvent>(_onAddFavorite);
    on<IntermediateTopicsRemoveFavoriteEvent>(_onRemoveFavorite);
    add(const IntermediateTopicsInitEvent());
  }

  final GetTopicsUseCase getTopicsUseCase = GetTopicsUseCase(
    topicRepository: getIt.get<TopicRepository>(),
  );
  final GetTopicsParams _getTopicsParams = const GetTopicsParams(
    levelId: 'XY9JcJLnZU6usBppFrFH',
  );

  final CreateBookmarkTopicUseCase createBookmarkTopicUseCase =
      CreateBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(IntermediateTopicsInitEvent event, emit) {
    add(const IntermediateTopicsLoadEvent());
  }

  void _onLoad(IntermediateTopicsLoadEvent event, emit) async {
    emit(IntermediateTopicsLoadingState(isOverlay: event.isRefresh));

    final topics = await getTopicsUseCase(_getTopicsParams);

    emit(IntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: event.isRefresh,
    ));
    topics.fold(
      (l) => emit(
        IntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        IntermediateTopicsLoadDoneState(
          topics: r.topics ?? [],
        ),
      ),
    );
  }

  void _onAddFavorite(IntermediateTopicsAddFavoriteEvent event, emit) async {
    emit(const IntermediateTopicsLoadingState(isOverlay: true));
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    emit(const IntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
    result.fold(
      (l) => emit(
        IntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const IntermediateTopicsAddFavoriteDoneState(),
      ),
    );
  }

  void _onRemoveFavorite(
      IntermediateTopicsRemoveFavoriteEvent event, emit) async {
    emit(const IntermediateTopicsLoadingState(isOverlay: true));
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const IntermediateTopicsLoadingState(
      showLoading: false,
      isOverlay: true,
    ));
    result.fold(
      (l) => emit(
        IntermediateTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const IntermediateTopicsRemoveFavoriteDoneState(),
      ),
    );
  }
}
