import '../../../../../base/usecase/usecase.base.dart';
import '../entities/app_intro_entity.dart';
import '../repositories/app_intro_repository.dart';

class GetAppIntrosUseCase with UseCase<void, List<AppIntroEntity>> {
  const GetAppIntrosUseCase({
    required this.appIntroRepository,
  });

  final AppIntroRepository appIntroRepository;

  @override
  Future<List<AppIntroEntity>> execute(void params) =>
      appIntroRepository.getAppIntros();
}
