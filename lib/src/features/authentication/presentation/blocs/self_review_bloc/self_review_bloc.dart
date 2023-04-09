import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../data/datasources/remote_data/self_review_remote_datasrc/models/self_level_model.dart';
import '../../../domain/entities/self_review/self_level_entity.dart';
import '../../../domain/repositories/self_review_repo/self_review_repository.dart';
import '../../../domain/usecases/self_review_usecases/get_levels_usecase.dart';

part 'self_review_event.dart';
part 'self_review_state.dart';

class SelfReviewBloc extends Bloc<SelfReviewEvent, SelfReviewState> {
  SelfReviewBloc() : super(const SelfReviewInitState()) {
    on<SelfReviewGetLevelsEvent>(_onGetLevels);
  }

  final GetLevelsUseCase _getLevelsUseCase =
      GetLevelsUseCase(selfReviewRepository: getIt.get<SelfReviewRepository>());

  _onGetLevels(SelfReviewGetLevelsEvent event, emit) async {
    emit(const SelfReviewGetLevelsLoadingState());
    final res = await _getLevelsUseCase(null);
    await emit(const SelfReviewGetLevelsLoadingState(showLoading: false));
    res.fold(
      (l) => emit(SelfReviewErrorState(
        exception: l,
      )),
      (r) => emit(SelfReviewGetLevelsDoneState(
        levels: r
          ..add(
              const SelfLevelModel('', '', "I don't know which level I am at"))
          ..add(const SelfLevelModel('', '', "I prefer not to tell")),
      )),
    );
  }
}
