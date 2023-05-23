import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/application_repository.dart';

class SaveApplicationThemeUseCase with UseCase<bool, void> {
  const SaveApplicationThemeUseCase({
    required this.applicationRepository,
  });

  final ApplicationRepository applicationRepository;

  @override
  Future<void> execute(bool params) =>
      applicationRepository.setTheme(isDark: params);
}
