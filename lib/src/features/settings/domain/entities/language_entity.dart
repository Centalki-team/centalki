import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  const LanguageEntity({
    required this.name,
    required this.locale,
  });

  final String name;
  final String locale;

  @override
  List<Object?> get props => [
        name,
        locale,
      ];
}
