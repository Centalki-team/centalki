import 'package:json_annotation/json_annotation.dart';

part 'get_noti_list_param.g.dart';

enum SortCreatedAtEnum {
  @JsonValue('createdAt:asc')
  asc,
  @JsonValue('createdAt:desc')
  desc,
}

@JsonSerializable(createFactory: false, includeIfNull: false)
class GetNotiListParam {
  const GetNotiListParam({
    this.page = 1,
    this.size = 10,
    this.sort,
  });

  final int page;
  final int size;
  final SortCreatedAtEnum? sort;

  Map<String, dynamic> toJson() => _$GetNotiListParamToJson(this);
}
