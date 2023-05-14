import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../shared/utilities/datetime_helper.dart';
import '../../../../../domain/entities/noti_list_item_entity.dart';

part 'noti_list_item_model.g.dart';

@JsonSerializable(createToJson: false)
class NotiListItemModel extends NotiListItemEntity {
  const NotiListItemModel({
    String? id,
    this.uid,
    this.createdAt,
    this.seenAt,
    NotiListItemDataModel? data,
    NotiListItemTitleModel? title,
    NotiListItemBodyModel? body,
  }) : super(
          id: id,
          createdAtTime: createdAt,
          seenAtTime: seenAt,
          data: data,
          title: title,
          body: body,
        );

  final String? uid;
  @JsonKey(fromJson: AppDateTimeHelper.stringToTime3Nullable)
  final DateTime? createdAt;
  @JsonKey(fromJson: AppDateTimeHelper.stringToTime3Nullable)
  final DateTime? seenAt;

  factory NotiListItemModel.fromJson(Map<String, dynamic> json) =>
      _$NotiListItemModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class NotiListItemDataModel extends NotiListItemDataEntity {
  const NotiListItemDataModel({
    String? sessionId,
    String? type,
  }) : super(
          sessionId: sessionId,
          type: type,
        );

  factory NotiListItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotiListItemDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class NotiListItemTitleModel extends NotiListItemTitleEntity {
  const NotiListItemTitleModel({
    String? en,
  }) : super(
          en: en,
        );

  factory NotiListItemTitleModel.fromJson(Map<String, dynamic> json) =>
      _$NotiListItemTitleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class NotiListItemBodyModel extends NotiListItemBodyEntity {
  const NotiListItemBodyModel({
    String? en,
  }) : super(
          en: en,
        );

  factory NotiListItemBodyModel.fromJson(Map<String, dynamic> json) =>
      _$NotiListItemBodyModelFromJson(json);
}
