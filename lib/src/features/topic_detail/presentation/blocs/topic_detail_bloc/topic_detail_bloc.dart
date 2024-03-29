import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../bookmark/domain/repositories/bookmark_repository.dart';
import '../../../../bookmark/domain/usecases/create_topic_phrase_bookmark_usecase.dart';
import '../../../../bookmark/domain/usecases/delete_topic_phrase_bookmark_usecase.dart';
import '../../../../bookmark/domain/usecases/params/create_topic_phrase_bookmark_params.dart';
import '../../../../bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../../../bookmark/topic/domain/usecases/create_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/delete_bookmark_topic_usecase.dart';
import '../../../../bookmark/topic/domain/usecases/params/create_bookmark_topic_params.dart';
import '../../../domain/entities/topic_detail_entity.dart';
import '../../../domain/repositories/topic_detail_repository.dart';
import '../../../domain/usecases/get_topic_detail_usecase.dart';

part 'topic_detail_event.dart';
part 'topic_detail_state.dart';

class TopicDetailBloc extends Bloc<TopicDetailEvent, TopicDetailState> {
  TopicDetailBloc() : super(const TopicDetailInitState()) {
    on<TopicDetailInitEvent>(_onInit);
    on<TopicDetailLoadEvent>(_onLoad);
    on<TopicDetailPhraseCreateBookmarkEvent>(_onCreateTopicPhraseBookmark);
    on<TopicDetailPhraseRemoveBookmarkEvent>(_onRemoveTopicPhraseBookmark);
    on<TopicDetailAddFavoriteEvent>(_onAddFavorite);
    on<TopicDetailRemoveFavoriteEvent>(_onRemoveFavorite);
    on<TopicDetailConnectTeacherEvent>(_onConnectTeacher);
    add(const TopicDetailInitEvent());
  }

  final _getTopicDetailUseCase = GetTopicDetailUseCase(
      topicDetailRepository: getIt.get<TopicDetailRepository>());
  final _createTopicPhraseBookmarkUseCase = CreateTopicPhraseBookmarkUseCase(
      bookmarkRepository: getIt.get<BookmarkRepository>());
  final _deleteTopicPhraseBookmarkUseCase = DeleteTopicPhraseBookmarkUseCase(
      bookmarkRepository: getIt.get<BookmarkRepository>());

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
    // try {
    //   final topicDetail = await DioClient.getTopicDetailById(event.topicId);
    //   emit(TopicDetailLoadDoneState(topicDetail: topicDetail));
    // } on Exception catch (e) {
    //   emit(
    //       TopicDetailLoadFailedState(errorMessage: e.toString().substring(11)));
    // }
    final result = await _getTopicDetailUseCase(event.topicId);
    result.fold(
      (error) => emit(TopicDetailLoadFailedState(
        exception: error,
        emitTime: DateTime.now(),
      )),
      (topicDetail) => emit(TopicDetailLoadDoneState(topicDetail: topicDetail)),
    );
  }

  _onCreateTopicPhraseBookmark(
      TopicDetailPhraseCreateBookmarkEvent event, emit) async {
    if (event.phraseId.isEmpty) return;

    emit(const TopicDetailLoadingState());
    final res = await _createTopicPhraseBookmarkUseCase(
        CreateTopicPhraseBookmarkParams(phraseId: event.phraseId));
    emit(const TopicDetailLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        TopicDetailLoadFailedState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        TopicPhraseCreateBookmarkSuccessState(
          phraseId: event.phraseId,
          emitTime: DateTime.now(),
        ),
      ),
    );
  }

  _onRemoveTopicPhraseBookmark(
      TopicDetailPhraseRemoveBookmarkEvent event, emit) async {
    if (event.bookmarkId.isEmpty) return;

    emit(const TopicDetailLoadingState());
    final res = await _deleteTopicPhraseBookmarkUseCase(event.bookmarkId);
    emit(const TopicDetailLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        TopicPhraseBookmarkAdjustFailedState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        TopicPhraseRemoveBookmarkSuccessState(
          bookmarkId: event.bookmarkId,
          emitTime: DateTime.now(),
        ),
      ),
    );
  }

  void _onAddFavorite(TopicDetailAddFavoriteEvent event, emit) async {
    emit(const TopicDetailLoadingState());
    final result = await createBookmarkTopicUseCase(
        CreateBookmarkTopicParams(topicId: event.topicId));
    emit(const TopicDetailLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        TopicDetailLoadFailedState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        const TopicDetailAddFavoriteDoneState(),
      ),
    );
  }

  void _onRemoveFavorite(TopicDetailRemoveFavoriteEvent event, emit) async {
    emit(const TopicDetailLoadingState());
    final result = await deleteBookmarkTopicUseCase(event.id);
    emit(const TopicDetailLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        TopicDetailLoadFailedState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        const TopicDetailRemoveFavoriteDoneState(),
      ),
    );
  }

  void _onConnectTeacher(TopicDetailConnectTeacherEvent event, emit) async {
    emit(const ConnectTeacherLoadingState());

    final topicId = event.topicId;
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        final studentId = FirebaseAuth.instance.currentUser?.uid ?? '';
        final sessionSchedule =
            await DioClient.createNewSessionSchedule(studentId, topicId);
        final sessionId = sessionSchedule.sessionId;
        emit(ConnectTeacherLoadDoneState(sessionId: sessionId));
      } on Exception catch (e) {
        var message = e.toString().split("Exception: ")[1];
        if (message.contains("Insufficient balance")) {
          emit(ConnectTeacherInsufficientBalanceState(message));
        } else {
          emit(ConnectTeacherLoadFailureState(message));
        }
      }
    } else {
      emit(ConnectTeacherLoadFailureState(S.current.txtNotSignIn));
    }
  }
}
