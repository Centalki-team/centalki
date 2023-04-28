import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';

part 'noti_detail_event.dart';
part 'noti_detail_state.dart';

class NotiDetailBloc extends Bloc<NotiDetailEvent, NotiDetailState> {
  NotiDetailBloc() : super(const NotiDetailInitState()) {
    on<NotiDetailLoadEvent>(_onLoadNotiDetail);
  }

  _onLoadNotiDetail(NotiDetailLoadEvent event, emit) {}
}
