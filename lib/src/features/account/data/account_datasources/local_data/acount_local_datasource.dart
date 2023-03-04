import '../../../domain/entities/user_account_entity.dart';

class AcountLocalDatasource {
  const AcountLocalDatasource();

  Future<UserAccountEntity> getUserAccountInfo() async => UserAccountEntity(
        accountEmail: 'htho379@gmail.com',
        fullName: 'Huỳnh Tấn Thọ',
        avatarUrl:
            'https://scontent.fsgn19-1.fna.fbcdn.net/v/t1.6435-9/121142429_2835057546728778_6729378624538972544_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=wo4oGVzWwdoAX-7xPTG&_nc_ht=scontent.fsgn19-1.fna&oh=00_AfC5lgVwutqrg5xUAbaYQIEE47nSE3NeYrTzKoFOO1jB-w&oe=642A35D4',
        accountPhoneNumber: '0123456789',
        accountCompletedSessions: 10,
        userProfile: UserProfileEntity(
          accountEnglishName: 'Tho Huynh',
          dateOfBirth: DateTime(2001, 01, 01),
          accountGender: Gender.male,
          accountBalance: 100,
          currentCostPerSession: 20,
          accountCurrency: 'VND',
        ),
      );
}
