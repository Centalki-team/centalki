import 'dart:async';

import 'package:centalki/base/temp_dio/dio_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/topic_detail.dart';

part 'topic_detail_event.dart';
part 'topic_detail_state.dart';

class TopicDetailBloc extends Bloc<TopicDetailEvent, TopicDetailState> {
  TopicDetailBloc() : super(const TopicDetailInitState()) {
    on<TopicDetailInitEvent>(_onInit);
    on<TopicDetailLoadEvent>(_onLoad);
    add(const TopicDetailInitEvent());
  }

  void _onInit(TopicDetailInitEvent event, emit) {
    add(const TopicDetailLoadEvent());
  }

  void _onLoad(TopicDetailLoadEvent event, emit) async {
    // final topicDetail = await DioClient.getTopicDetailById(topicId);
    // emit(TopicDetailLoadDoneState(topicDetail: topicDetail));
  }
}
