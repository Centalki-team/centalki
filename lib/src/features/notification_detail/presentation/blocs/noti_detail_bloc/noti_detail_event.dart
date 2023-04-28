part of 'noti_detail_bloc.dart';

abstract class NotiDetailEvent {
  const NotiDetailEvent();
}

class NotiDetailLoadEvent extends NotiDetailEvent {
  const NotiDetailLoadEvent({
    required this.notiId,
  });

  final String notiId;
}
