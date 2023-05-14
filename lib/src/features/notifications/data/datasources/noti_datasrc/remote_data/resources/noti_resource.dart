import '../../../../../../../../base/domain/resource.base.dart';

class NotificationMarkReadSingleResource extends Resource {
  const NotificationMarkReadSingleResource(String id)
      : super('/notification/$id/seen');
}

class NotificationMarkAllReadResource extends Resource {
  const NotificationMarkAllReadResource()
      : super('/notification/mark-all-seen');
}

class NotificationMarkAllUnreadResource extends Resource {
  const NotificationMarkAllUnreadResource()
      : super('/notification/mark-all-unseen');
}

class NotificationListResource extends Resource {
  const NotificationListResource() : super('/notification');
}
