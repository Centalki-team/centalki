import '../../../../../../../../base/domain/resource.base.dart';

class NotificationDetailResource extends Resource {
  const NotificationDetailResource(String id) : super('/notification/$id');
}
