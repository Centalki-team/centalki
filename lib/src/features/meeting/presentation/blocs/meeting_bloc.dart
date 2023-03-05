import 'package:flutter_bloc/flutter_bloc.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc() : super(const MeetingInitState()) {
    on<MeetingInitEvent>(_onInit);
  }

  void _onInit(MeetingInitEvent event, emit) async {}
}
