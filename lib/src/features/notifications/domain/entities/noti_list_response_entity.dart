import 'package:equatable/equatable.dart';

import 'noti_list_item_entity.dart';
import 'noti_list_meta_data_entity.dart';

class NotiListResponseEntity extends Equatable {
  const NotiListResponseEntity({
    this.meta,
    this.data = const [],
  });

  final NotiListMetaDataEntity? meta;
  final List<NotiListItemEntity> data;

  @override
  List<Object?> get props => [
        meta,
        data,
      ];
}
