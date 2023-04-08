import '../../../../domain/entities/intro_status_entity.dart';

class IntroStatusModel extends IntroStatusEntity {
  const IntroStatusModel({
    bool isRead = false,
  }) : super(
          isRead: isRead,
        );
}
