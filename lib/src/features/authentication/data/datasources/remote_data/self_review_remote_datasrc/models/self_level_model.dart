import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/self_review/self_level_entity.dart';

part 'self_level_model.g.dart';

@JsonSerializable(createToJson: false)
class SelfLevelModel extends SelfLevelEntity {
  const SelfLevelModel(
    String? id,
    String? code,
    String? name,
  ) : super(
          id: id ?? '',
          code: code ?? '',
          name: name ?? '',
        );

  factory SelfLevelModel.fromJson(Map<String, dynamic> json) =>
      _$SelfLevelModelFromJson(json);
}
