import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/elementary_topics_bloc/elementary_topics_bloc.dart';
import 'elementary_topics_view.dart';

class ElementaryTopicsPage extends StatelessWidget {
  const ElementaryTopicsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<ElementaryTopicsBloc>(
        create: (context) => ElementaryTopicsBloc(),
        child: const ElementaryTopicView(),
      );
}
