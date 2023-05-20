import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/application_repository.dart';

class SaveApplicationLocaleUseCase with UseCase<String, void> {
  const SaveApplicationLocaleUseCase({
    required this.applicationRepository,
  });

  final ApplicationRepository applicationRepository;

  @override
  Future<void> execute(String params) =>
      applicationRepository.setLocale(params);
}
