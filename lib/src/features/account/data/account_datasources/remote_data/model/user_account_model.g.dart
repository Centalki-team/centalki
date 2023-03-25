// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountModel _$UserAccountModelFromJson(Map<String, dynamic> json) =>
    UserAccountModel(
      role: json['role'] == null
          ? null
          : UserRoleModel.fromJson(json['role'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : UserProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      completedSession: json['completedSession'] as int?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      disabled: json['disabled'] as bool?,
      metadata: json['metadata'] == null
          ? null
          : UserMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>),
      providerData: (json['providerData'] as List<dynamic>?)
          ?.map(
              (e) => UserProviderDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokensValidAfterTime: json['tokensValidAfterTime'] as String?,
    );

UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) =>
    UserRoleModel(
      id: json['id'] as String?,
      role: json['role'] as String?,
      uid: json['uid'] as String?,
    );

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: json['id'] as String?,
      englishName: json['englishName'] as String?,
      dob: DateTimeHelper.stringToTime3Nullable(json['dob'] as String?),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      uid: json['uid'] as String?,
      balance: json['balance'] as int?,
      costPerSession: json['costPerSession'] as int?,
      currency: json['currency'] as String?,
      bio: json['bio'] as String?,
      interestedTopicIds: (json['interestedTopicIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

const _$GenderEnumMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
  Gender.others: 'OTHERS',
};

UserMetadataModel _$UserMetadataModelFromJson(Map<String, dynamic> json) =>
    UserMetadataModel(
      lastSignInTime: json['lastSignInTime'] as String?,
      creationTime: json['creationTime'] as String?,
    );

UserProviderDataModel _$UserProviderDataModelFromJson(
        Map<String, dynamic> json) =>
    UserProviderDataModel(
      uid: json['uid'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      providerId: json['providerId'] as String?,
    );
