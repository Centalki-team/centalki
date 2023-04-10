import 'package:equatable/equatable.dart';

import '../../usecases/sign_up_usecase/params/set_initial_level_params.dart';

class SelfLevelEntity extends Equatable {
  const SelfLevelEntity({
    required this.id,
    required this.code,
    required this.name,
    this.levelType = LevelTypeEnum.specific,
  });

  final String id;
  final String code;
  final String name;
  final LevelTypeEnum levelType;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        levelType,
      ];
}
