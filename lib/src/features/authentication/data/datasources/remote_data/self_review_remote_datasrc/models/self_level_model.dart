import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/self_review/self_level_entity.dart';
import '../../../../../domain/usecases/sign_up_usecase/params/set_initial_level_params.dart';

part 'self_level_model.g.dart';

@JsonSerializable(createToJson: false)
class SelfLevelModel extends SelfLevelEntity {
  const SelfLevelModel(
    String? id,
    String? code,
    String? name,
    this.typeForEntity,
  ) : super(
          id: id ?? '',
          code: code ?? '',
          name: name ?? '',
          levelType: typeForEntity ?? LevelTypeEnum.specific,
        );

  final LevelTypeEnum? typeForEntity;

  factory SelfLevelModel.fromJson(Map<String, dynamic> json) =>
      _$SelfLevelModelFromJson(json);
}
