import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../domain/entities/topic_item_entity.dart';

part 'pre_intermediate_topics_event.dart';

part 'pre_intermediate_topics_state.dart';

class PreIntermediateTopicsBloc extends Bloc<PreIntermediateTopicsEvent, PreIntermediateTopicsState> {
  PreIntermediateTopicsBloc() : super(const TopicsInitState()) {
    on<PreIntermediateTopicsInitEvent>(_onInit);
    on<PreIntermediateTopicsLoadEvent>(_onLoad);
    add(const PreIntermediateTopicsInitEvent());
  }

  void _onInit(PreIntermediateTopicsInitEvent event, emit) {
    add(const PreIntermediateTopicsLoadEvent());
  }

  void _onLoad(PreIntermediateTopicsLoadEvent event, emit) async {
    final topics = await DioClient.getTopicList();

    emit(PreIntermediateTopicsLoadDoneState(topics: topics));
  }
}
