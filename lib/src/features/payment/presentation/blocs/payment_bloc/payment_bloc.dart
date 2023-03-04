import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitState()) {
    on<PaymentValidateEvent>(_onValidate);
  }

  _onValidate(PaymentValidateEvent event, emit) =>
      emit(const PaymentValidateState());
}
