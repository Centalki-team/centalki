import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue('MALE')
  male,
  @JsonValue('FEMALE')
  female,
  @JsonValue('OTHERS')
  others
}

class UserAccountEntity {
  const UserAccountEntity({
    this.accountEmail,
    this.fullName,
    this.avatarUrl,
    this.userProfile,
  });

  final String? accountEmail;
  final String? fullName;
  final String? avatarUrl;
  final UserProfileEntity? userProfile;
}

class UserProfileEntity {
  const UserProfileEntity({
    this.accountEnglishName,
    this.dateOfBirth,
    this.accountGender,
    this.accountBalance,
    this.currentCostPerSession,
    this.accountCurrency,
  });

  final String? accountEnglishName;
  final DateTime? dateOfBirth;
  final Gender? accountGender;
  final int? accountBalance;
  final int? currentCostPerSession;
  final String? accountCurrency;
}
