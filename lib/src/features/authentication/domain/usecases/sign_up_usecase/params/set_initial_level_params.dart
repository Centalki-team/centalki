import 'package:json_annotation/json_annotation.dart';

part 'set_initial_level_params.g.dart';

enum LevelTypeEnum {
  @JsonValue('SPECIFIC')
  specific,
  @JsonValue('UNKNOWN')
  unknown,
  @JsonValue('NOT_SHARE')
  notShare,
}

@JsonSerializable(createFactory: false)
class SetInitialLevelUseCaseParams {
  const SetInitialLevelUseCaseParams({
    this.initialLevelId,
    required this.initialLevelType,
  });

  final String? initialLevelId;
  final LevelTypeEnum initialLevelType;

  Map<String, dynamic> toJson() => _$SetInitialLevelUseCaseParamsToJson(this);
}
