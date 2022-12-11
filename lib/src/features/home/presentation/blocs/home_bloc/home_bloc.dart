import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitState()) {
    on<HomeInitEvent>(_onInit);
    on<HomeChangeTabEvent>(_onChangeTab);
    add(const HomeChangeTabEvent(desTab: 0));
  }

  void _onInit(HomeInitEvent event, emit) {}

  void _onChangeTab(HomeChangeTabEvent event, emit) {
    emit(HomeChangeTabState(
      currentTab: event.desTab,
    ));
  }
}
