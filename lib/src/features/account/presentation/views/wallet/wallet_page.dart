import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/wallet_bloc/wallet_bloc.dart';
import 'wallet_view.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => WalletBloc()..add(const WalletInitEvent()),
        child: const WalletView(),
      );
}
