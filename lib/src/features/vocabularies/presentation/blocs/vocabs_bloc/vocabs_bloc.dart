import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';
import '../../../../bookmark/domain/repositories/bookmark_repository.dart';
import '../../../../bookmark/domain/usecases/delete_topic_phrase_bookmark_usecase.dart';
import '../../../../bookmark/domain/usecases/get_user_bookmark_vocabs_usecase.dart';

part 'vocabs_event.dart';
part 'vocabs_state.dart';

class VocabsBloc extends Bloc<VocabsEvent, VocabsState> {
  VocabsBloc() : super(const VocabsInitState()) {
    on<VocabsBookmarkedLoadEvent>(_onLoadBookmarkedVocabs);
    on<VocabsRemoveBookmarkEvent>(_onVocabRemoveBookmark);
  }

  final _getUserBookmarkVocabsUseCase = GetUserBookmarkVocabsUseCase(
      bookmarkRepository: getIt.get<BookmarkRepository>());
  final _deleteTopicPhraseBookmarkUseCase = DeleteTopicPhraseBookmarkUseCase(
      bookmarkRepository: getIt.get<BookmarkRepository>());

  _onLoadBookmarkedVocabs(VocabsBookmarkedLoadEvent event, emit) async {
    emit(const VocabsLoadingState(
      showOverlay: false,
    ));
    final res = await _getUserBookmarkVocabsUseCase(null);
    emit(const VocabsLoadingState(
      showLoading: false,
      showOverlay: false,
    ));
    res.fold(
      (l) => emit(VocabsErrorState(exception: l, emitTime: DateTime.now())),
      (r) => emit(VocabsBookmarkedLoadDoneState(vocabsList: r)),
    );
  }

  _onVocabRemoveBookmark(VocabsRemoveBookmarkEvent event, emit) async {
    emit(const VocabsLoadingState());
    final res = await _deleteTopicPhraseBookmarkUseCase(event.bookmarkId);
    emit(const VocabsLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        VocabsErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        VocabsRemoveBookmarkSuccessState(
          bookmarkId: event.bookmarkId,
          emitTime: DateTime.now(),
        ),
      ),
    );
  }
}
