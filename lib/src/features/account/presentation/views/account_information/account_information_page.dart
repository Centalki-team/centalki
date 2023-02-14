import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/account_information_bloc/account_information_bloc.dart';
import 'account_information_view.dart';

class AccountInformationPage extends StatelessWidget {
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            AccountInformationBloc()..add(const AccountInformationInitEvent()),
        child: const AccountInformationView(),
      );
}
