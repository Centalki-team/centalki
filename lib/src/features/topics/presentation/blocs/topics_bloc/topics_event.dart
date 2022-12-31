part of 'topics_bloc.dart';

abstract class TopicsEvent {
  const TopicsEvent();
}

class TopicsInitEvent extends TopicsEvent {
  const TopicsInitEvent();
}

class TopicsLoadEvent extends TopicsEvent {
  const TopicsLoadEvent();
}
