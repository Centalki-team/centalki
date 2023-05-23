import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/application_repository.dart';

class GetApplicationThemeUseCase with UseCase<void, bool> {
  const GetApplicationThemeUseCase({
    required this.applicationRepository,
  });

  final ApplicationRepository applicationRepository;

  @override
  Future<bool> execute(void params) => applicationRepository.checkThemeIsDark();
}
