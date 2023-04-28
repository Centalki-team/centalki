import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/noti_list_response_entity.dart';
import 'noti_list_item_model.dart';
import 'noti_list_meta_data_model.dart';

part 'noti_list_response_model.g.dart';

@JsonSerializable(createToJson: false)
class NotiListResponseModel extends NotiListResponseEntity {
  const NotiListResponseModel({
    NotiListMetaDataModel? meta,
    List<NotiListItemModel> data = const [],
  }) : super(
          meta: meta,
          data: data,
        );

  factory NotiListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotiListResponseModelFromJson(json);
}
