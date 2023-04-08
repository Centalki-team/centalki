import 'package:equatable/equatable.dart';

class IntroStatusEntity extends Equatable {
  const IntroStatusEntity({
    this.isRead = false,
  });

  final bool isRead;

  @override
  List<Object?> get props => [
        isRead,
      ];
}
