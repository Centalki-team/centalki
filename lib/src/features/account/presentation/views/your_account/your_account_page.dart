import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/your_account_bloc/your_account_bloc.dart';
import 'your_account_view.dart';

class YourAccountPage extends StatelessWidget {
  const YourAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            YourAccountBloc()..add(const YourAccountLoadEvent()),
        child: const YourAccountView(),
      );
}
