import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/application_repository.dart';

class GetApplicationLocaleUseCase with UseCase<void, String> {
  const GetApplicationLocaleUseCase({
    required this.applicationRepository,
  });

  final ApplicationRepository applicationRepository;

  @override
  Future<String> execute(void params) => applicationRepository.getLocale();
}
