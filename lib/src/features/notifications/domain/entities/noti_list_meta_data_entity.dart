import 'package:equatable/equatable.dart';

class NotiListMetaDataEntity extends Equatable {
  const NotiListMetaDataEntity({
    this.hasNextPage,
    this.hasPrevPage,
    this.page,
    this.size,
  });

  final bool? hasNextPage;
  final bool? hasPrevPage;
  final int? page;
  final int? size;

  @override
  List<Object?> get props => [
    hasNextPage,
    hasPrevPage,
    page,
    size,
  ];
}
