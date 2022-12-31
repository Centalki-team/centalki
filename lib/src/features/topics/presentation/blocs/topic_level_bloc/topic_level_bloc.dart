import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'topic_level_event.dart';
part 'topic_level_state.dart';

class TopicLevelBloc extends Bloc<TopicLevelEvent, TopicLevelState> {
  TopicLevelBloc() : super(const TopicLevelInitState()) {
    on<TopicLevelInitEvent>(_onInit);
    on<TopicLevelChangeTabEvent>(_onChangeTab);
  }

  void _onInit(TopicLevelInitEvent event, emit) {}

  void _onChangeTab(TopicLevelChangeTabEvent event, emit) {
    emit(TopicLevelChangeTabState(currentTab: event.desTab));
  }
}
