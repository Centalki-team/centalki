part of 'self_review_bloc.dart';

abstract class SelfReviewState extends Equatable {
  const SelfReviewState();

  @override
  List<Object?> get props => [];
}

class SelfReviewInitState extends SelfReviewState {
  const SelfReviewInitState();
}

class SelfReviewGetLevelsLoadingState extends SelfReviewState {
  const SelfReviewGetLevelsLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class SelfReviewGetLevelsDoneState extends SelfReviewState {
  const SelfReviewGetLevelsDoneState({
    required this.levels,
  });

  final List<SelfLevelEntity> levels;

  @override
  List<Object?> get props => [
        levels,
      ];
}

class SelfReviewErrorState extends SelfReviewState {
  const SelfReviewErrorState({
    required this.exception,
  });

  final AppException exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}
