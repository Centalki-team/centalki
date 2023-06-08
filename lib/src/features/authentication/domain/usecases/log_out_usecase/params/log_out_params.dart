import 'package:json_annotation/json_annotation.dart';

part 'log_out_params.g.dart';

@JsonSerializable(createFactory: false)
class LogOutUseCaseParams {
  const LogOutUseCaseParams({
    required this.token,
  });

  final String token;

  Map<String, dynamic> toJson() => _$LogOutUseCaseParamsToJson(this);
}
