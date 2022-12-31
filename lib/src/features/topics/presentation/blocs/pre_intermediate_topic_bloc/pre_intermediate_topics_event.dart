part of 'pre_intermediate_topics_bloc.dart';

abstract class PreIntermediateTopicsEvent {
  const PreIntermediateTopicsEvent();
}

class PreIntermediateTopicsInitEvent extends PreIntermediateTopicsEvent {
  const PreIntermediateTopicsInitEvent();
}

class PreIntermediateTopicsLoadEvent extends PreIntermediateTopicsEvent {
  const PreIntermediateTopicsLoadEvent();
}
