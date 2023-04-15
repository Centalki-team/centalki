import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/vocabs_bloc/vocabs_bloc.dart';
import 'vocabs_view.dart';

class VocabsPage extends StatelessWidget {
  const VocabsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<VocabsBloc>(
        create: (context) => VocabsBloc(),
        child: const VocabsView(),
      );
}
