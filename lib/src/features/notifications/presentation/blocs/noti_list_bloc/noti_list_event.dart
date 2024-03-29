part of 'noti_list_bloc.dart';

abstract class NotiListEvent {
  const NotiListEvent();
}

class NotiListLoadDataEvent extends NotiListEvent {
  const NotiListLoadDataEvent();
}

class NotiListMarkReadSingleEvent extends NotiListEvent {
  const NotiListMarkReadSingleEvent({
    required this.notiId,
  });

  final String notiId;
}

class NotiListMarkAllReadEvent extends NotiListEvent {
  const NotiListMarkAllReadEvent();
}

class NotiListMarkAllUnreadEvent extends NotiListEvent {
  const NotiListMarkAllUnreadEvent();
}
