import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/noti_list_item_entity.dart';
import '../../../domain/entities/noti_list_response_entity.dart';
import '../../../domain/repositories/noti_list_repository.dart';
import '../../../domain/usecases/get_noti_list_usecase.dart';
import '../../../domain/usecases/mark_all_noti_as_read_usecase.dart';
import '../../../domain/usecases/mark_all_noti_as_unread_usecase.dart';
import '../../../domain/usecases/mark_single_noti_as_read_usecase.dart';
import '../../../domain/usecases/params/get_noti_list_param.dart';

part 'noti_list_event.dart';
part 'noti_list_state.dart';

class NotiListBloc extends Bloc<NotiListEvent, NotiListState> {
  NotiListBloc() : super(const NotiListInitState()) {
    on<NotiListLoadDataEvent>(_onLoadNotiList);
    on<NotiListMarkReadSingleEvent>(_onMarkSingleNotiAsRead);
    on<NotiListMarkAllReadEvent>(_onMarkAllRead);
    on<NotiListMarkAllUnreadEvent>(_onMarkAllAsUnread);
  }

  final _getNotiListUseCase =
      GetNotiListUseCase(notiListRepository: getIt.get<NotiListRepository>());
  final _markSingleNotiAsReadUseCase = MarkSingleNotiAsReadUseCase(
      notiListRepository: getIt.get<NotiListRepository>());
  final _markAllReadUseCase = MarkAllNotiAsReadUseCase(
      notiListRepository: getIt.get<NotiListRepository>());
  final _markAllAsUnreadUseCase = MarkAllNotiAsUnreadUseCase(
      notiListRepository: getIt.get<NotiListRepository>());

  _onLoadNotiList(NotiListLoadDataEvent event, emit) async {
    emit(const NotiListLoadingState());
    final res = await _getNotiListUseCase(const GetNotiListParam(
      sort: SortCreatedAtEnum.desc,
    ));
    emit(const NotiListLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        NotiListErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) {
        var todayList = <NotiListItemEntity>[];
        var thisWeekList = <NotiListItemEntity>[];
        var previousList = <NotiListItemEntity>[];
        var nowDate = DateTime.now();
        var startWeekDate = DateTime(nowDate.year, nowDate.month,
            nowDate.day - (nowDate.weekday % 7 - 1));
        var endWeekDate = DateTime(
            startWeekDate.year, startWeekDate.month, startWeekDate.day + 6);
        var indexStep = 0;
        for (indexStep; indexStep < r.data.length; indexStep++) {
          if (nowDate
                  .difference(r.data[indexStep].createdAtTime ?? nowDate)
                  .inDays ==
              0) {
            todayList.add(r.data[indexStep]);
          } else if ((r.data[indexStep].createdAtTime ?? nowDate)
                  .isAfter(startWeekDate) &&
              (r.data[indexStep].createdAtTime ?? nowDate)
                  .isBefore(endWeekDate)) {
            thisWeekList.add(r.data[indexStep]);
          } else {
            previousList.addAll(r.data.sublist(indexStep));
            break;
          }
        }
        emit(
          NotiListLoadDoneState(
            notiListResponseEntity: r,
            todayList: todayList,
            thisWeekList: thisWeekList,
            previousList: previousList,
          ),
        );
      },
    );
  }

  _onMarkSingleNotiAsRead(NotiListMarkReadSingleEvent event, emit) async {
    emit(const NotiListLoadingState(isOverlay: true));
    final result = await _markSingleNotiAsReadUseCase(event.notiId);
    emit(const NotiListLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        NotiListErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        NotiListMarkSingleAsReadSuccess(
          emitTime: DateTime.now(),
        ),
      ),
    );
  }

  _onMarkAllRead(NotiListMarkAllReadEvent event, emit) async {
    emit(const NotiListLoadingState(isOverlay: true));
    final result = await _markAllReadUseCase(null);
    emit(const NotiListLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        NotiListErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => add(const NotiListLoadDataEvent()),
    );
  }

  _onMarkAllAsUnread(NotiListMarkAllUnreadEvent event, emit) async {
    emit(const NotiListLoadingState(isOverlay: true));
    final result = await _markAllAsUnreadUseCase(null);
    emit(const NotiListLoadingState(showLoading: false));
    result.fold(
      (l) => emit(
        NotiListErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => add(const NotiListLoadDataEvent()),
    );
  }
}
