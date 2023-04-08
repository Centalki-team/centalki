import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/app_intro_repository.dart';

class GetStatusAppIntroUseCase with UseCase<void, bool> {
  const GetStatusAppIntroUseCase({
    required this.appIntroRepository,
  });

  final AppIntroRepository appIntroRepository;

  @override
  Future<bool> execute(void params) =>
      appIntroRepository.getStatusAppIntroFirstTime();
}
