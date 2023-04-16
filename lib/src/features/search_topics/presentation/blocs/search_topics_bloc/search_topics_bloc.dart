import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../topics/domain/entities/topic_item_entity.dart';
import '../../../domain/repositories/search_topics_repository.dart';
import '../../../domain/usecases/params/search_topics_params.dart';
import '../../../domain/usecases/search_topics_usecase.dart';

part 'search_topics_event.dart';
part 'search_topics_state.dart';

class SearchTopicsBloc extends Bloc<SearchTopicsEvent, SearchTopicsState> {
  SearchTopicsBloc() : super(const SearchTopicsInitState()) {
    on<SearchTopicsQuerySubmitEvent>(_onSearchQuerySubmit);
  }

  final _searchTopicsUseCase = SearchTopicsUseCase(
      searchTopicsRepository: getIt.get<SearchTopicsRepository>());

  _onSearchQuerySubmit(SearchTopicsQuerySubmitEvent event, emit) async {
    if (event.searchContent.isEmpty) return;

    emit(const SearchTopicsLoadingState());
    final res = await _searchTopicsUseCase(SearchTopicsParams(
      keyword: event.searchContent,
    ));
    emit(const SearchTopicsLoadingState(showLoading: false));
    res.fold(
      (l) => emit(
        SearchTopicsErrorState(
          exception: l,
          emitTime: DateTime.now(),
        ),
      ),
      (r) => emit(
        SearchTopicsLoadDoneState(
          topicsListEntity: r,
        ),
      ),
    );
  }
}
