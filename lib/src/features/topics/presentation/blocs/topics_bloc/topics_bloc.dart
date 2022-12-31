import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../domain/entities/topic_item_entity.dart';

part 'topics_event.dart';

part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc() : super(const TopicsInitState()) {
    on<TopicsInitEvent>(_onInit);
    on<TopicsLoadEvent>(_onLoad);
    add(const TopicsInitEvent());
  }

  void _onInit(TopicsInitEvent event, emit) {
    add(const TopicsLoadEvent());
  }

  void _onLoad(TopicsLoadEvent event, emit) async {
    final topics = await DioClient.getTopicList();

    emit(TopicsLoadDoneState(topics: topics));
  }
}
