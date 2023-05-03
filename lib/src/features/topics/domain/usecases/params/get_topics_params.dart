import 'package:json_annotation/json_annotation.dart';

part 'get_topics_params.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class GetTopicsParams {
  const GetTopicsParams({
    this.levelId,
    this.categoryId,
    this.keyword,
  });

  final String? levelId;
  final String? categoryId;
  final String? keyword;

  Map<String, dynamic> toJson() => _$GetTopicsParamsToJson(this);
}
