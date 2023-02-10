import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'your_account_event.dart';
part 'your_account_state.dart';

class YourAccountBloc extends Bloc<YourAccountEvent, YourAccountState> {
  YourAccountBloc() : super(const YourAccountInitState()) {
   on<YourAccountInitEvent>(_onInit);
   on<YourAccountLoadEvent>(_onLoad);
   on<YourAccountLogOutEvent>(_onLogOut);
  }

  void _onInit(YourAccountInitEvent event, emit) {}

  void _onLoad(YourAccountLoadEvent event, emit) {}

  void _onLogOut(YourAccountLogOutEvent event, emit) async {
    await FirebaseAuth.instance.signOut();
  }
}