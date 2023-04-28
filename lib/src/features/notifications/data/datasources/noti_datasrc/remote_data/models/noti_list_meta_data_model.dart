import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/noti_list_meta_data_entity.dart';

part 'noti_list_meta_data_model.g.dart';

@JsonSerializable(createToJson: false)
class NotiListMetaDataModel extends NotiListMetaDataEntity {
  const NotiListMetaDataModel({
    bool? hasNextPage,
    bool? hasPrevPage,
    int? page,
    int? size,
  }) : super(
          hasNextPage: hasNextPage,
          hasPrevPage: hasPrevPage,
          page: page,
          size: size,
        );

  factory NotiListMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotiListMetaDataModelFromJson(json);
}
