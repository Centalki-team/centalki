import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';

part 'vocabs_event.dart';
part 'vocabs_state.dart';

class VocabsBloc extends Bloc<VocabsEvent, VocabsState> {
  VocabsBloc() : super(const VocabsInitState());
}
