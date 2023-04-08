import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/app_intro_repository.dart';

class SaveStatusAppIntroUseCase with UseCase<void, void> {
  const SaveStatusAppIntroUseCase({
    required this.appIntroRepository,
  });

  final AppIntroRepository appIntroRepository;

  @override
  Future<void> execute(void params) =>
      appIntroRepository.saveStatusAppIntroFirstTime();
}
