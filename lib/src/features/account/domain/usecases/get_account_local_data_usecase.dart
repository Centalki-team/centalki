import '../../../../../base/usecase/usecase.base.dart';
import '../../data/account_datasources/local_data/acount_local_datasource.dart';
import '../entities/user_account_entity.dart';

class GetAccountLocalDataUseCase with UseCase<void, UserAccountEntity> {
  const GetAccountLocalDataUseCase();

  final AcountLocalDatasource acountLocalDatasource =
      const AcountLocalDatasource();

  @override
  Future<UserAccountEntity> execute(void params) =>
      acountLocalDatasource.getUserAccountInfo();
}
