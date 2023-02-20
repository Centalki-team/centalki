import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../base/helpers/time_helper.dart';
import '../../../../domain/entities/user_account_entity.dart';

part 'user_account_model.g.dart';

@JsonSerializable(createToJson: false)
class UserAccountModel extends UserAccountEntity {
  const UserAccountModel({
    this.role,
    this.profile,
    this.completedSession,
    this.uid,
    this.email,
    this.emailVerified,
    this.phoneNumber,
    this.displayName,
    this.photoUrl,
    this.disabled,
    this.metadata,
    this.providerData,
    this.tokensValidAfterTime,
  }) : super(
          accountEmail: email,
          fullName: displayName,
          avatarUrl: photoUrl,
          accountPhoneNumber: phoneNumber,
          userProfile: profile,
          accountCompletedSessions: completedSession,
        );

  final UserRoleModel? role;
  final UserProfileModel? profile;
  final int? completedSession;
  final String? uid;
  final String? email;
  final bool? emailVerified;
  final String? phoneNumber;
  final String? displayName;
  final String? photoUrl;
  final bool? disabled;
  final UserMetadataModel? metadata;
  final List<UserProviderDataModel>? providerData;
  final String? tokensValidAfterTime;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserRoleModel {
  const UserRoleModel({
    this.id,
    this.role,
    this.uid,
  });

  final String? id;
  final String? role;
  final String? uid;

  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    this.id,
    this.englishName,
    this.dob,
    this.gender,
    this.uid,
    this.balance,
    this.costPerSession,
    this.currency,
    this.bio,
    this.interestedTopicIds,
  }) : super(
          accountEnglishName: englishName,
          dateOfBirth: dob,
          accountGender: gender,
          accountBalance: balance,
          currentCostPerSession: costPerSession,
          accountCurrency: currency,
          accountBio: bio,
          accountInterestedTopicIds: interestedTopicIds,
        );

  final String? id;
  final String? englishName;
  @JsonKey(name: 'dob', fromJson: DateTimeHelper.stringToTime3Nullable)
  final DateTime? dob;
  final Gender? gender;
  final String? uid;
  final int? balance;
  final int? costPerSession;
  final String? currency;
  final String? bio;
  final List<String>? interestedTopicIds;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserMetadataModel {
  const UserMetadataModel({
    this.lastSignInTime,
    this.creationTime,
  });

  final String? lastSignInTime;
  final String? creationTime;

  factory UserMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$UserMetadataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserProviderDataModel {
  const UserProviderDataModel({
    this.uid,
    this.displayName,
    this.email,
    this.providerId,
  });

  final String? uid;
  final String? displayName;
  final String? email;
  final String? providerId;

  factory UserProviderDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProviderDataModelFromJson(json);
}
