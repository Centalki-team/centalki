import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../di/di_module.dart';
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
    add(const PreIntermediateTopicsInitEvent());
  }

  final GetTopicsUseCase getTopicsUseCase = GetTopicsUseCase(
    topicRepository: getIt.get<TopicRepository>(),
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
          topics: r,
        ),
      ),
    );
  }
}
