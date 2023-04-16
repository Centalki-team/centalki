import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../../bookmark/topic/domain/entities/bookmark_topic_entity.dart';
import '../../../bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../../bookmark/topic/domain/usecases/delete_bookmark_topic_usecase.dart';
import '../../../bookmark/topic/domain/usecases/get_bookmark_topics_usecase.dart';

part 'favorite_topics_event.dart';

part 'favorite_topics_state.dart';

class FavoriteTopicsBloc
    extends Bloc<FavoriteTopicsEvent, FavoriteTopicsState> {
  FavoriteTopicsBloc() : super(const FavoriteTopicsInitState()) {
    on<FavoriteTopicsInitEvent>(_onInit);
    on<FavoriteTopicsLoadEvent>(_onLoad);
    on<RemoveFavoriteTopicEvent>(_onRemoveFavorite);
    add(const FavoriteTopicsInitEvent());
  }

  final GetBookmarkTopicsUseCase getBookmarkTopicsUseCase =
      GetBookmarkTopicsUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  final DeleteBookmarkTopicUseCase deleteBookmarkTopicUseCase =
      DeleteBookmarkTopicUseCase(
    bookmarkTopicRepository: getIt.get<BookmarkTopicRepository>(),
  );

  void _onInit(FavoriteTopicsInitEvent event, emit) {
    add(const FavoriteTopicsLoadEvent());
  }

  void _onLoad(FavoriteTopicsLoadEvent event, emit) async {
    emit(const FavoriteTopicsLoadingState());

    final topics = await getBookmarkTopicsUseCase(null);
    emit(const FavoriteTopicsLoadingState(showLoading: false));
    topics.fold(
      (l) => emit(
        FavoriteTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        FavoriteTopicsLoadDoneState(
          bookmarks: r,
        ),
      ),
    );
  }

  void _onRemoveFavorite(RemoveFavoriteTopicEvent event, emit) async {
    emit(const FavoriteTopicsLoadingState());
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const FavoriteTopicsLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        FavoriteTopicsErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const RemoveFavoriteTopicDoneState(),
      ),
    );
  }
}
